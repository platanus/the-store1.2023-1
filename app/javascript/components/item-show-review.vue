<script setup lang="ts">
import { ref } from 'vue';
import type { Item } from '../api/items';
import type { Review } from '../api/reviews';
import ItemShowReviewWrite from './item-show-review-write.vue';
import ItemShowReviewForm from './item-show-review-form.vue';
import ItemShowReviewList from './item-show-review-list.vue';

type Props = {
  item: Item
  reviews: Review[]
  bought: number
  reviewed: number
};
defineProps<Props>();

const showReviewForm = ref(false);
</script>

<template>
  <div class="flex flex-col content-start gap-8">
    <span class="text-xl font-bold text-zinc-800">
      Opiniones del producto
    </span>
    <div class="flex w-full gap-16">
      <item-show-review-write
        v-if="!showReviewForm && bought && !reviewed"
        :item="item"
        @open-review-form="showReviewForm = true"
      />
    </div>
    <hr class="border-t border-zinc-800">
    <item-show-review-form
      v-if="showReviewForm"
      :item="item"
      @close-review-form="showReviewForm = false"
    />
    <item-show-review-list
      :reviews="reviews"
    />
  </div>
</template>
