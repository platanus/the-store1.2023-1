<script setup lang="ts">
import { ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import purchasesApi from '../api/purchases';
import type { Item } from '../api/items';
import currency from '../utils/currency.js';

type Props = {
  item: Item
};
const props = defineProps<Props>();

const loading = ref(false);
const { notify } = useNotification();
async function buy() {
  loading.value = true;
  try {
    await purchasesApi.create(props.item.id);
    notify({ text: 'Genial, recibimos tu orden! Te contactaremos para coordinar', type: 'success' });
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    loading.value = false;
  }
}

</script>
<template>
  <div class="flex w-full flex-row content-start gap-10">
    <img
      :src="item.image['sm']['url']"
      alt="Product image"
      class="w-full"
    >
    <div class="flex flex-col content-start justify-between">
      <div class="flex flex-col content-start gap-4 text-zinc-800">
        <span class="text-lg">
          {{ item.name }}
        </span>
        <span class="text-3xl">
          {{ currency(item.price) }}
        </span>
      </div>
      <span class="text-base text-zinc-800">
        {{ item.description }}
      </span>
      <base-button
        :variant="loading ? 'disabled' : 'primary'"
        :disabled="loading"
        @click="buy"
      >
        Comprar
      </base-button>
    </div>
  </div>
</template>
