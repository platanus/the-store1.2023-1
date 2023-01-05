<script setup lang="ts">
import { ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import purchasesApi from '../api/purchases';
import currency from '../utils/currency.js';

type Props = {
  itemId: number
  name: string
  price: number
  imageUrl: string
};
const props = defineProps<Props>();

const loading = ref(false);
const { notify } = useNotification();
async function buy() {
  loading.value = true;
  try {
    await purchasesApi.create(props.itemId);
    notify({ text: 'Genial, recibimos tu orden! Te contactaremos para coordinar', type: 'success' });
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    loading.value = false;
  }
}
</script>

<template>
  <div class="flex w-80 flex-col items-center gap-4 overflow-hidden rounded-lg bg-white shadow-md">
    <img
      :src="imageUrl"
      alt="Product image"
      class="w-full"
    >
    <div class="flex flex-col gap-2 text-center text-zinc-800">
      <span class="text-xl font-bold">
        {{ currency(price) }}
      </span>
      <span>
        {{ name }}
      </span>
    </div>
    <div class="flex w-full flex-row text-center text-blue-800">
      <button
        class="w-1/2 py-4 disabled:text-zinc-500"
        :disabled="loading"
        @click="buy"
      >
        Comprar
      </button>
      <a
        :href="loading ? '/' : `/items/${itemId}`"
        class="w-1/2 py-4"
        :class="{ 'text-zinc-500': loading }"
      >
        Detalles
      </a>
    </div>
  </div>
</template>
