const links = document.querySelectorAll('.link-item');

links.forEach(link => {
  link.addEventListener('mouseenter', () => {
    link.style.transform = 'translateY(-5px)';
    link.style.boxShadow = '0 4px 10px rgba(0, 191, 255, 0.3)';
  });

  link.addEventListener('mouseleave', () => {
    link.style.transform = 'none';
    link.style.boxShadow = 'none';
  });
});
