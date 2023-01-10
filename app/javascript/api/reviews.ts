import api from './index';
import type { User } from './users';
import type { Item } from './items';

export interface Review {
  id: number;
  body: string;
  user: User;
  item: Item;
  createdAt: string;
  updatedAt: string;
}

export type ReviewForm = {
  itemId: number;
  body: string | null,
};

export default {
  create(review: ReviewForm) {
    const path = '/api/internal/reviews';

    return api({
      method: 'post',
      url: path,
      data: {
        review,
      },
    });
  },
};
