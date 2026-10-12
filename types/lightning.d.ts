declare module 'lightning/platformShowToastEvent' {
  type ToastVariant = 'info' | 'success' | 'warning' | 'error';
  type ToastMode = 'dismissible' | 'pester' | 'sticky';
  type ToastMessageData = string | { url: string; label: string };

  interface ToastOptions {
    title: string;
    message?: string;
    //? Substitui os placeholders {0}, {1}... em title/message
    messageData?: ToastMessageData[];
    variant?: ToastVariant;
    mode?: ToastMode;
  }

  export class ShowToastEvent extends CustomEvent<ToastOptions> {
    constructor(toast: ToastOptions);
  }
}
