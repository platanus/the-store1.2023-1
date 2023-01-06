import api from './index';
import type { User } from './users';
import type { Item } from './items';

export interface Review {
  id: number;
  body: string;
  user: User;
  item: Item;
  createdAt: string;
}
