<script setup lang="ts">
const variants = {
  primary: 'bg-blue-800 text-white hover:bg-blue-900',
  secondary: 'border-blue-800 bg-transparent text-blue-800 hover:bg-blue-50',
  danger: 'bg-rose-400 hover:bg-rose-500 text-white',
  success: 'bg-green-400 text-white hover:bg-green-500',
  disabled: 'bg-zinc-500 text-white cursor-not-allowed',
  cancel: 'bg-transparent text-zinc-800',
};

interface Props {
  variant?: keyof typeof variants
}
withDefaults(
  defineProps<Props>(),
  {
    variant: 'primary',
  },
);
</script>

<template>
  <button
    class="rounded-full px-4 py-2 text-lg font-semibold"
    :class="variants[variant]"
  >
    <slot />
  </button>
</template>
