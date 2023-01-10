<script setup lang="ts">
import { reactive, ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import reviewsApi, { type ReviewForm } from '../api/reviews';
import type { Item } from '../api/items';

type Props = {
  item: Item
};

const props = defineProps<Props>();

const form = reactive({
  itemId: props.item.id,
  body: '',
} as ReviewForm);

defineEmits<{(e: 'closeReviewForm'): void}>();

const loading = ref(false);

const { notify } = useNotification();

async function writeReview() {
  loading.value = true;
  try {
    await reviewsApi.create(form);
    notify({ text: 'Gracias por tu comentario!', type: 'success' });
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    window.location.href = `/items/${form.itemId}`;
  }
}

</script>
<template>
  <form
    class="flex flex-col items-center gap-3 py-2.5 px-2"
    @submit.prevent="writeReview"
  >
    <p class="text-base text-zinc-800">
      Qué te pareció el producto?
    </p>
    <p class="text-base text-zinc-800">
      Agrega un comentario
    </p>
    <base-input
      v-model="form.body"
      placeholder="Escriba su reseña aquí"
      name="body"
      class="w-80"
    />
    <div class="flex w-80 flex-row gap-4">
      <base-button
        type="button"
        class="w-full"
        variant="cancel"
        @click="$emit('closeReviewForm')"
      >
        Cancel
      </base-button>
      <base-button
        type="submit"
        class="w-full rounded-lg"
      >
        Enviar
      </base-button>
    </div>
  </form>
</template>
