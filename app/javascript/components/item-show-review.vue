<script setup lang="ts">
import type { Review } from '../api/reviews';
import ItemShowReviewList from './item-show-review-list.vue';

type Props = {
  reviews: Review[]
};
defineProps<Props>();

</script>

<template>
  <div class="flex flex-col content-start gap-8">
    <span class="text-xl font-bold text-zinc-800">
      Opiniones del producto
    </span>
    <hr class="border-t border-zinc-800">
    <item-show-review-list
      :reviews="reviews"
    />
  </div>
</template>
