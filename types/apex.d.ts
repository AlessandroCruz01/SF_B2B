//? Substitui as typings geradas em .sfdx/typings/lwc/apex (excluídas no tsconfig),
//? que tipam métodos Apex só como Promise e quebram o uso com @wire.
declare module '@salesforce/apex/*' {
  import type { WireAdapterConstructor } from 'lwc';

  type ApexMethod = ((params?: Record<string, unknown>) => Promise<any>) & WireAdapterConstructor;

  const apexMethod: ApexMethod;
  export default apexMethod;
}
