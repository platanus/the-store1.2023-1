<script setup lang="ts">
import type { Item } from '../api/items';

type Props = {
  item: Item
};
defineProps<Props>();

defineEmits<{(e: 'openReviewForm'): void}>();
</script>
<template>
  <div class="flex w-full flex-col items-center">
    <p class="text-base text-zinc-800">
      Cómo te fue con el producto?
    </p>
    <base-button
      class="w-full border"
      variant="secondary"
      @click="$emit('openReviewForm')"
    >
      Escribir mi opinión
    </base-button>
  </div>
</template>
