<script setup lang="ts">
import formatDate from 'utils/format-date';

type Props = {
  userName: string
  body: string | null
  createdAt: string
};
defineProps<Props>();
</script>

<template>
  <div class="flex flex-col gap-4">
    <div class="flex w-full items-center justify-end">
      <span class="text-sm text-zinc-500"> {{ formatDate(createdAt) }} </span>
    </div>
    <span
      v-if="body"
      class="text-base text-zinc-800"
    >
      {{ body }}
    </span>
    <span
      v-else
      class="text-base italic text-zinc-300"
    >
      No dejó comentario
    </span>
    <span class="text-base font-bold text-zinc-800"> {{ userName }} </span>
    <div class="py-4 px-12">
      <hr class="border-t border-zinc-800">
    </div>
  </div>
</template>
