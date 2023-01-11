<script setup lang="ts">
import { ref } from 'vue';
import { es } from 'date-fns/locale';
import { parse, format } from 'date-fns';
import { useNotification } from '@kyvg/vue3-notification';
import purchasesApi, { type Purchase } from '../api/purchases';

type Props = {
  purchase: Purchase
};
defineProps<Props>();

function dateFormatter(date: Date, type = '/'): string {
  if (type === '/') {
    return format(new Date(date), 'dd/MM/yyyy', { locale: es });
  }
  let dateStr = format(new Date(date), "EEEE d 'de' LLLL", { locale: es });
  dateStr = (dateStr.charAt(0).toUpperCase() + dateStr.slice(1));

  return dateStr;
}

</script>
<template>
  <section class="flex flex-col items-center">
    <h2 class="mb-4 text-4xl font-medium">
      Recibimos tu orden!
    </h2>
    <p class="text-center text-xl">
      Próximamente podrás ver por acá la fecha de entrega e información de
      contacto de la empresa que realizará el despacho
    </p>
  </section>
  <section class="flex flex-col divide-y divide-zinc-500 rounded-2xl border border-zinc-500 shadow-md">
    <h2 class="my-3 ml-8 text-2xl font-bold">
      Tu compra
    </h2>
    <div class="flex">
      <div class="">
        <img
          :src="purchase.item.image['sm']['url']"
          alt="Product image"
        >
      </div>
      <div class="flex grow flex-col divide-y divide-zinc-500">
        <!--  -->
        <div class="flex grow items-center">
          <p class="pl-8 text-xl">
            {{ purchase.item.name }}
          </p>
        </div>
        <div class="flex grow items-center">
          <p class="pl-8 text-xl">
            Total: ${{ purchase.item.price }}
          </p>
        </div>
        <div class="flex grow items-center">
          <p class="pl-8 text-xl">
            Fecha de compra: {{ dateFormatter(purchase.createdAt) }}
          </p>
        </div>
      </div>
    </div>
  </section>
  <section class="flex flex-col divide-y divide-zinc-500 rounded-2xl border border-zinc-500 shadow-md">
    <h2 class="my-3 ml-8 text-2xl font-bold">
      Empresa de despacho
    </h2>
    <div>
      <p class="py-2 pl-8 text-xl font-medium">
        {{ purchase.deliveryCompany.name }}
      </p>
      <p class="py-2 pl-8 text-xl">
        +{{ purchase.deliveryCompany.phoneNumber }}
      </p>
    </div>
  </section>
  <section class="flex flex-col items-center">
    <p class="pb-4">
      Tu orden está <span class="font-bold">programada</span> para el:
    </p>
    <p class="pb-6 text-4xl font-bold">
      {{ dateFormatter(purchase.deliveryDate, 'text') }}
    </p>
    <div class="flex items-center">
      <p class="pr-4">
        No puedes ese día?
      </p>
      <button class="rounded-2xl border border-blue-800 text-lg">
        <p class="mx-4 my-2 font-medium text-blue-800">
          Quiero reagendar
        </p>
      </button>
    </div>
    <section class="w-full bg-zinc-50">
      <div class="flex flex-col items-center">
        <p>
          Dinos que día quieres que te entreguemos el producto
        </p>
        <input
          type="text"
          class="h-10 w-48 rounded-2xl border border-zinc-300 px-4 py-2 placeholder:text-zinc-300"
          placeholder="12/12/2022"
        >
        <div class="flex">
          <button class="rounded-lg text-lg text-zinc-500">
            <p class="mx-4 my-2 text-lg text-zinc-800">
              Cancelar
            </p>
          </button>
          <button class="rounded-lg bg-blue-800  text-lg">
            <p class="mx-4 my-2 text-lg text-white">
              Enviar
            </p>
          </button>
        </div>
      </div>
    </section>
  </section>
</template>
