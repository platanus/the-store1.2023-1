import { format, parseISO } from 'date-fns';
import esLocale from 'date-fns/locale/es';

function formatDate(date?: string | null): string {
  if (!date) return '';

  return format(parseISO(date), 'dd MMMM yyyy', {
    locale: esLocale,
  });
}

export default formatDate;
