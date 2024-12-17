document.addEventListener('turbo:load', () => {
  const accordionHeaders = document.querySelectorAll('[data-accordion-header="true"]');

  accordionHeaders.forEach((header) => {
    header.addEventListener('click', (event) => {
      // Prevent default button behavior
      event.preventDefault();

      // Find the next sibling content element
      const content = header.closest('div').querySelector('[data-accordion-content="true"]');
      const icon = header.querySelector('[data-accordion-icon]');

      const isHidden = content.classList.contains('hidden');

      if (isHidden) {
        content.classList.remove('hidden');
        setTimeout(() => {
          content.classList.remove('opacity-0');
        }, 10);
      } else {
        content.classList.add('opacity-0');
        content.addEventListener(
          'transitionend',
          () => {
            content.classList.add('hidden');
          },
          { once: true }
        );
      }

      icon.classList.toggle('rotate-180');
    });
  });
});