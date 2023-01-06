import { useDateFormat } from '@vueuse/core';

function formatDate(date: string | null): string {
  return date ? useDateFormat(date, 'D MMMM YYYY', { locales: 'es-SP' }).value : '';
}

export default formatDate;
