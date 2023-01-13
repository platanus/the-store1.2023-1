<script setup lang="ts">
import { ref } from 'vue';
import { useDateFormat } from '@vueuse/core';
import type { Purchase } from '../api/purchases';

type Props = {
  purchase: Purchase
};
defineProps<Props>();

function dateFormatter(date: string) {
  return useDateFormat(date, 'DD/MM/YY').value;
}

</script>
<template>
  <p>Tu compra</p>
  <table>
    <tr>
      <td>Producto</td>
      <td>{{ purchase.item.name }}</td>
    </tr>
    <tr>
      <td>Precio</td>
      <td>{{ `$${purchase.item.price}` }}</td>
    </tr>
    <tr>
      <td>Fecha</td>
      <td>{{ dateFormatter(purchase.createdAt) }}</td>
    </tr>
  </table>
  <img
    :src="purchase.item.image['sm']['url']"
    alt="Product image"
    class="w-full"
  >
  {{ purchase.item.name }}
  {{ `$${purchase.item.price}` }}
  {{ dateFormatter(purchase.createdAt) }}
</template>
