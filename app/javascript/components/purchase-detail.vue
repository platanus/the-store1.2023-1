<script setup lang="ts">
import { ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import { parse, format } from 'date-fns';
import es from 'date-fns/locale/es';
import purchasesApi, { type Purchase } from '../api/purchases';

type Props = {
  basePurchase: Purchase
};
const props = defineProps<Props>();
const showReschedule = ref(false);
const newDeliveryDate = ref('');
const purchase = ref(props.basePurchase);

function dateFormatter(date: Date, type = 'dd/MM/yyyy'): string {
  const formattedDate = format(new Date(date), type, { locale: es });
  const uppercaseDate = (formattedDate.charAt(0).toUpperCase() + formattedDate.slice(1));

  return uppercaseDate;
}

const MONEY_DENOMINATOR = '$';
const loading = ref(false);
const { notify } = useNotification();
async function sendReschedule() {
  loading.value = true;
  const newDate = parse(newDeliveryDate.value, 'dd/MM/yyyy', new Date());
  try {
    const request = await purchasesApi.update(props.basePurchase.id, String(newDate));
    notify({ text: 'Has cambiado la fecha de entrega correctamente', type: 'success' });
    purchase.value = request.data.purchase;
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    loading.value = false;
  }
}

</script>
<template>
  <section
    v-if="purchase.status === 'pending' && purchase.deliveryDate === null && purchase.deliveryCompany === null"
    class="flex flex-col items-center"
  >
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
      <div>
        <img
          :src="purchase.item.image['sm']['url']"
          alt="Product image"
        >
      </div>
      <div class="flex grow flex-col divide-y divide-zinc-500">
        <div class="flex grow items-center">
          <p class="pl-8 text-xl">
            {{ purchase.item.name }}
          </p>
        </div>
        <div class="flex grow items-center">
          <p class="pl-8 text-xl">
            Total: {{ MONEY_DENOMINATOR }}{{ purchase.item.price }}
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
  <section
    v-if="purchase.deliveryCompany"
    class="flex flex-col divide-y divide-zinc-500 rounded-2xl border border-zinc-500 shadow-md"
  >
    <h2 class="my-3 ml-8 text-2xl font-bold">
      Empresa de despacho
    </h2>
    <div>
      <p class="pb-2 pt-3 pl-8 text-xl font-medium">
        {{ purchase.deliveryCompany.name }}
      </p>
      <p class="py-3 pl-8 text-xl">
        +{{ purchase.deliveryCompany.phoneNumber }}
      </p>
    </div>
  </section>
  <section
    v-if="purchase.deliveryDate && purchase.status === 'pending'"
    class="flex flex-col items-center"
  >
    <p class="pb-4 text-xl">
      Tu orden está <span class="font-bold">programada</span> para el:
    </p>
    <p class="pb-6 text-4xl font-medium">
      {{ dateFormatter(purchase.deliveryDate, "EEEE d 'de' LLLL") }}
    </p>
    <div
      v-if="!showReschedule"
      class="flex items-center"
    >
      <p class="pr-4 text-lg">
        No puedes ese día?
      </p>
      <button
        class="rounded-2xl border border-blue-800 text-lg"
        @click="showReschedule = true"
      >
        <p class="mx-4 my-2 font-medium text-blue-800">
          Quiero reagendar
        </p>
      </button>
    </div>
    <section
      v-else
      class="w-full bg-zinc-50"
    >
      <div class="flex flex-col items-center">
        <p class="my-3">
          Dinos que día quieres que te entreguemos el producto
        </p>
        <div class="flex flex-col">
          <div class="relative">
            <input
              v-model="newDeliveryDate"
              type="text"
              class="mb-3 w-80 rounded-lg border border-zinc-300 shadow-sm placeholder:text-zinc-300"
              placeholder="12/12/2022"
            >
            <inline-svg
              :src="require('/app/assets/images/calendar-icon.svg')"
              class="absolute top-2 right-2 h-6 w-6 text-zinc-500"
            />
          </div>
          <div class="flex pb-3">
            <button
              class="grow rounded-lg text-lg text-zinc-500"
              @click="showReschedule = false"
            >
              <p class="mx-4 my-2 text-lg font-bold text-zinc-800">
                Cancelar
              </p>
            </button>
            <button
              class="grow rounded-lg bg-blue-800 px-4 py-2 text-lg font-bold text-white"
              @click="sendReschedule"
            >
              Enviar
            </button>
          </div>
        </div>
      </div>
    </section>
  </section>
</template>
