/**
 * Nuke Toast Component
 * Notification messages with auto-dismiss
 * Usage: <nuke-toast class="zen|soft|solid" duration="3000">Message</nuke-toast>
 * Or programmatically: NukeToast.show('Message', {style: 'zen', duration: 3000})
 */

class NukeToast extends HTMLElement {
  connectedCallback() {
    // Set ARIA role
    this.setAttribute('role', 'status');
    this.setAttribute('aria-live', 'polite');

    // Default to zen class if no variant class is set
    if (!this.classList.contains('zen') && !this.classList.contains('soft') && !this.classList.contains('solid')) {
      this.classList.add('zen');
    }

    // Add close button
    this.addCloseButton();

    // Auto-dismiss if duration is set
    const duration = parseInt(this.getAttribute('duration')) || 0;
    if (duration > 0) {
      this.autoDismiss(duration);
    }

    // Show toast with animation
    requestAnimationFrame(() => {
      this.classList.add('show');
    });
  }

  addCloseButton() {
    const closeBtn = document.createElement('button');
    closeBtn.textContent = '×';
    closeBtn.className = 'toast-close';
    closeBtn.setAttribute('aria-label', 'Close notification');
    closeBtn.addEventListener('click', () => this.dismiss());
    this.appendChild(closeBtn);
  }

  autoDismiss(duration) {
    this.dismissTimer = setTimeout(() => {
      this.dismiss();
    }, duration);
  }

  dismiss() {
    if (this.dismissTimer) {
      clearTimeout(this.dismissTimer);
    }

    this.classList.remove('show');
    this.classList.add('hide');

    // Remove from DOM after animation
    setTimeout(() => {
      this.remove();
    }, 300);
  }
}

// Helper function to create toasts programmatically
NukeToast.show = function(message, options = {}) {
  const toast = document.createElement('nuke-toast');

  // Create message span to hold text (so close button doesn't interfere)
  const messageSpan = document.createElement('span');
  messageSpan.textContent = message;
  messageSpan.className = 'toast-message';
  toast.appendChild(messageSpan);

  // Use class instead of style attribute to avoid conflict with inline styles
  if (options.style) {
    toast.classList.add(options.style);
  }

  if (options.duration !== undefined) {
    toast.setAttribute('duration', options.duration);
  } else {
    toast.setAttribute('duration', '3000'); // Default 3 seconds
  }

  // Get or create toast container
  let container = document.querySelector('.nuke-toast-container');
  if (!container) {
    container = document.createElement('div');
    container.className = 'nuke-toast-container';
    document.body.appendChild(container);
  }

  container.appendChild(toast);
  return toast;
};

// Register custom element
customElements.define('nuke-toast', NukeToast);
