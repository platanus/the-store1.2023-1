import api from './index';
import type { User } from './users';
import type { Item } from './items';
import type { DeliveryCompany } from './delivery_companies';

export interface Purchase {
  id: number;
  status: 'pending' | 'delivered';
  createdAt: Date;
  deliveryDate: Date;
  user: User;
  item: Item;
  deliveryCompany: DeliveryCompany;
}

export default {
  create(itemId: number) {
    const path = '/api/internal/purchases';

    return api({
      method: 'post',
      url: path,
      data: {
        purchase: { itemId },
      },
    });
  },
  update(purchaseId: number, deliveryDate: string) {
    const path = `/api/internal/purchases/${purchaseId}`;

    return api({
      method: 'patch',
      url: path,
      data: {
        purchase: { deliveryDate },
      },
    });
  },
};
