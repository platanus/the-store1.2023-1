<script setup lang="ts">
import type { Review } from '../api/reviews';
import ItemShowReviewListCard from './item-show-review-list-card.vue';

type Props = {
  reviews: Review[]
};
defineProps<Props>();
</script>

<template>
  <div class="flex w-full flex-col gap-y-4">
    <item-show-review-list-card
      v-for="review in reviews"
      :key="review.id"
      :user-email="review.user.email"
      :body="review.body"
      :created-at="review.createdAt"
    />
  </div>
</template>
