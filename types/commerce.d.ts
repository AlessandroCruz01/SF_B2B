declare module 'commerce/*';

declare module 'commerce/productApi' {
  import type { WireAdapterConstructor } from 'lwc';
  export const ProductAdapter: WireAdapterConstructor;
  export const ProductSearchAdapter: WireAdapterConstructor;
}
