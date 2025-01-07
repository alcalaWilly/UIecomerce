/*=============== SHOW MENU ===============*/


/*===== MENU SHOW =====*/
/* Validate if constant exists */
const navMenu = document.getElementById('nav-menu'),
      navToggle = document.getElementById('nav-toggle'),
      navClose = document.getElementById('nav-close')

/*===== MENU HIDDEN =====*/
/* Validate if constant exists */
if(navToggle){
  navToggle.addEventListener("click", ()=>{
    navMenu.classList.add('show-menu')
  })
}

if(navClose){
  navClose.addEventListener("click", ()=>{
    navMenu.classList.remove('show-menu')
  })
}


/*=============== SHOW CART ===============*/
const cart = document.getElementById('cart'),
      cartShop = document.getElementById('cart-shop'),
      cartClose = document.getElementById('cart-close');

/*===== CART SHOW =====*/
/* Validate if constant exists */
if (cartShop) {
  cartShop.addEventListener("click", () => {
    cart.classList.toggle('show-cart');
    
    // Si el carrito se muestra, deshabilita el scroll de la página principal
    if (cart.classList.contains('show-cart')) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = ''; // Restaura el scroll si se cierra
    }
  });
}

/*===== CART HIDDEN =====*/
/* Validate if constant exists */
if (cartClose) {
  cartClose.addEventListener("click", () => {
    cart.classList.remove('show-cart');
    
    // Restaura el scroll de la página principal al cerrar el carrito
    document.body.style.overflow = '';
  });
}
/*=============== SHOW LOGIN ===============*/
const login = document.getElementById('login'),
      loginShop = document.getElementById('login-button'),
      loginClose = document.getElementById('login-close')


/*===== LOGIN SHOW =====*/
/* Validate if constant exists */
if(loginShop){
  loginShop.addEventListener("click", ()=>{
    login.classList.toggle('show-login')
  })
}

/*===== LOGIN HIDDEN =====*/
/* Validate if constant exists */
if(loginClose){
  loginClose.addEventListener("click", ()=>{
    login.classList.remove('show-login')
  })
}

/*=============== HOME SWIPER ===============*/
var homeSwiper = new Swiper(".home-swiper", {
    spaceBetween: 30,
    loop: 'true',
    autoplay: true,
	  autoplayTimeout: 500, 
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
  });

/*=============== CHANGE BACKGROUND HEADER ===============*/
function scrollHeader(){
    const header = document.getElementById('header')
    const link1 = document.getElementById('link1')
    const link2 = document.getElementById('link2')
    const link3 = document.getElementById('link3')
    const link4 = document.getElementById('link4')
    const link5 = document.getElementById('link5')
    const link6 = document.getElementById('link6')
    const link8 = document.getElementById('link7')
    const link9 = document.getElementById('link8')
    const link7 = document.getElementById('nav-close')
    const menu = document.getElementById('nav-menu')
    const logoBlanco = document.getElementById('logoBlanco');
    const logoNegro = document.getElementById('logoNegro');
    
    
    if (window.scrollY >= 500) {
      header.classList.add('scroll-header');
      link1.classList.add('scroll-menu');
      link2.classList.add('scroll-menu');
      link3.classList.add('scroll-menu');
      link4.classList.add('scroll-menu');
      link5.classList.add('scroll-menu');
      link6.classList.add('scroll-menu');
      link7.classList.add('scroll-menu');
      link8.classList.add('scroll-menu');
      link9.classList.add('scroll-menu');
      menu.classList.add('scroll-menu');

      // Cambiar al logo negro
      logoBlanco.classList.add('hidden');
      logoNegro.classList.remove('hidden');
  } else {
      header.classList.remove('scroll-header');
      link1.classList.remove('scroll-menu');
      link2.classList.remove('scroll-menu');
      link3.classList.remove('scroll-menu');
      link4.classList.remove('scroll-menu');
      link5.classList.remove('scroll-menu');
      link6.classList.remove('scroll-menu');
      link7.classList.remove('scroll-menu');
      link8.classList.remove('scroll-menu');
      link9.classList.remove('scroll-menu');
      menu.classList.remove('scroll-menu');

      // Revertir al logo blanco
      logoBlanco.classList.remove('hidden');
      logoNegro.classList.add('hidden');
  }
    
}
window.addEventListener('scroll',scrollHeader)

/*=============== NEW SWIPER ===============*/
// var newSwiper = new Swiper(".new-swiper", {
//     spaceBetween: 20,
//     centeredSlides: true,
//     slidesPerView: 3,
//     loop: 'true',
//     navigation: {
//         nextEl: ".swiper-button-next",
//         prevEl: ".swiper-button-prev",
//       },
//   });

  // var newSwiper = new Swiper(".mySwiper", {
  //   watchSlidesProgress: true,
  //   slidesPerView: 'auto',
  // });
// ***********************************************************
  // let newSwiper;

  // function initSwiper() {
  //   if (window.innerWidth > 767) {
  //     // Solo iniciar Swiper en pantallas grandes
  //     if (!newSwiper) {
  //       newSwiper = new Swiper(".mySwiper", {
  //         watchSlidesProgress: true,
  //         slidesPerView: 'auto',
  //       });
  //     }
  //   }if (window.innerWidth > 576){
  //     // Solo iniciar Swiper en pantallas grandes
  //     if (!newSwiper) {
  //       newSwiper = new Swiper(".mySwiper", {
  //         watchSlidesProgress: true,
  //         slidesPerView: 'auto',
  //       });
  //     }
  //   }
  //   else {
  //     // Destruir Swiper en móviles
  //     if (newSwiper) {
  //       newSwiper.destroy(true, true);
  //       newSwiper = null;
  //     }
  //   }
  // }
  
  // // Inicializar Swiper al cargar la página
  // initSwiper();
  
  // // Reajustar al redimensionar la pantalla
  // window.addEventListener("resize", initSwiper);

  // ***********************************************************
  let swipers = []; // Array para almacenar instancias de Swiper

  function initSwipers() {
    const sections = document.querySelectorAll(".new.section"); // Selecciona únicamente las secciones específicas
  
    sections.forEach((section, index) => {
      const swiperContainer = section.querySelector(".mySwiper"); // Swiper en la sección actual
      const wrapper = section.querySelector(".new-wrapper"); // Wrapper asociado
  
      if (!swiperContainer || !wrapper) {
        console.warn(`Sección ${index + 1} no tiene un Swiper o wrapper válido.`);
        return;
      }
  
      if (window.innerWidth > 767) {
        // Pantallas grandes
        if (!swipers[index]) {
          console.log(`Inicializando Swiper para sección ${index + 1}...`);
          swipers[index] = new Swiper(swiperContainer, {
            watchSlidesProgress: true,
            slidesPerView: "auto",
            //spaceBetween: 20,  Espaciado entre slides
            freeMode: true, // Permite el scroll libre en pantallas grandes
          });
        }
        wrapper.style.display = "flex"; // Diseño para Swiper en pantallas grandes
        wrapper.style.gridTemplateColumns = ""; // Resetear estilos de grid
      } else {
        // Pantallas pequeñas
        destroySwiperIfInitialized(index); // Destruir Swiper si existe
        wrapper.style.display = "grid";
        wrapper.style.gridTemplateColumns = "repeat(2, 1fr)"; // Siempre 2 columnas
      }
    });
  }
  
  function destroySwiperIfInitialized(index) {
    if (swipers[index]) {
      console.log(`Destruyendo Swiper para sección ${index + 1}...`);
      swipers[index].destroy(true, true); // Destruir instancia de Swiper
      swipers[index] = null; // Limpiar referencia
    }
  }
  
  document.addEventListener("DOMContentLoaded", () => {
    console.log("Configuración inicial de Swipers...");
    initSwipers(); // Inicializar configuración inicial
  });
  
  window.addEventListener("resize", () => {
    console.log("Redimensionando...");
    initSwipers(); // Reajustar al cambiar tamaño de pantalla
  });
// **********************************************************************************



// let newSwiper2;

//   function initSwiper2() {
//     if (window.innerWidth > 576) {  
//       // Activar Swiper para pantallas grandes
//       if (!newSwiper2) {
//         newSwiper2 = new Swiper(".mySwiper", {
//           watchSlidesProgress: true,
//           slidesPerView: 'auto',
//         });
//       }
  
//       // Asegúrate de que el wrapper vuelva al diseño de Swiper
//       const wrapper = document.querySelector(".new-wrapper");
//       if (wrapper) {
//         wrapper.style.display = "flex";
//       }
//     } else {
//       // Desactivar Swiper en pantallas móviles
//       if (newSwiper2) {
//         newSwiper2.destroy(true, true);
//         newSwiper2 = null;
//       }
  
//       // Cambiar el diseño a cuadrícula en móviles
//       const wrapper = document.querySelector(".new-wrapper");
//       if (wrapper) {
//         wrapper.style.display = "grid";
//       }
//     }

//   }
  
//   // Inicializar Swiper al cargar la página
//   initSwiper2();
  
//   // Reajustar al redimensionar la pantalla
//   window.addEventListener("resize", initSwiper2);
  
/*=============== SHOW SCROLL UP ===============*/ 

function scrollUp(){
  const scrollUp = document.getElementById('scroll-up');
  const scrollWatsapp = document.getElementById('scroll-whatsapp');

  if(this.scrollY >=350){
    scrollUp.classList.add('show-scrollup');
    scrollWatsapp.classList.add('show-scrollupWatsapp');
  }else{
    scrollUp.classList.remove('show-scrollup')
    scrollWatsapp.classList.remove('show-scrollupWatsapp')
  } 
}

window.addEventListener('scroll',scrollUp)
/*=============== LIGHT BOX ===============*/


/*=============== QUESTIONS ACCORDION ===============*/


/*=============== STYLE SWITCHER ===============*/

/*========== MENU DE PRODUCTOS */
// Selecciona todos los botones
let listElements = document.querySelectorAll('.list__button-filter--click');

// Itera sobre los botones
listElements.forEach(listElement => {
    // Define el menú relacionado con el botón
    let menu = listElement.nextElementSibling;

    // Inicializa los elementos visibles
    menu.style.height = `${menu.scrollHeight}px`;

    // Agrega el evento de clic
    listElement.addEventListener('click', () => {
        listElement.classList.toggle('arrow');

        // Si el menú está abierto (tiene una altura), ciérralo
        if (menu.style.height === `${menu.scrollHeight}px`) {
            menu.style.height = '0'; // Oculta
        } else {
            // Si está cerrado, expándelo
            menu.style.height = `${menu.scrollHeight}px`;
        }
    });
});



// menuuuu asideeeeeeeeeee
// Selecciona el div con la clase filterMenu
// Espera a que el DOM esté completamente cargado
// document.addEventListener('DOMContentLoaded', () => {
//   // Selecciona el elemento del menú
//   let filterMenu = document.querySelector('.filterMenu');

//   // Selecciona el elemento <aside> que deseas modificar
//   let asideElement = document.querySelector('.main-wrapper aside');

//   // Selecciona la imagen del arrow
//   let arrowImage = document.querySelector('.listFilter');

//   // Verifica que los elementos existan antes de agregar el event listener
//   if (filterMenu && asideElement && arrowImage) {
//       // Agrega un event listener para manejar el clic
//       filterMenu.addEventListener('click', () => {
//           // Alterna el tamaño del aside
//           if (asideElement.style.flexGrow === "0") {
//               asideElement.style.flexGrow = "0.4"; // Regresa al estilo original
//           } else {
//               asideElement.style.flexGrow = "0"; // Oculta el aside
//           }

//           // Alterna la rotación de la flecha
//           arrowImage.classList.toggle('rotated');
//       });
//   } else {
//       console.error('Uno o más elementos no fueron encontrados en el DOM:');
//       if (!filterMenu) console.error('No se encontró el elemento con la clase .filterMenu');
//       if (!asideElement) console.error('No se encontró el elemento <aside> en .main-wrapper');
//       if (!arrowImage) console.error('No se encontró el elemento con la clase .listFilter');
//   }
// });
//====================== CAMBIO DE IMAGEN EN LA PARTE DE DETALLE =============================

// let listiMG = document.querySelectorAll('.image__selectos-click');

// // Itera sobre los botones
// listElements.forEach(listElement => {
//     // Define el menú relacionado con el botón
//     let menu = listElement.nextElementSibling;

//     // Inicializa los elementos visibles
//     menu.style.height = `${menu.scrollHeight}px`;

//     // Agrega el evento de clic
//     listElement.addEventListener('click', () => {
//         listElement.classList.toggle('arrowt');

//         // Si el menú está abierto (tiene una altura), ciérralo
//         if (menu.style.height === `${menu.scrollHeight}px`) {
//             menu.style.height = '0'; // Oculta
//         } else {
//             // Si está cerrado, expándelo
//             menu.style.height = `${menu.scrollHeight}px`;
//         }
//     });
// });


// ======== ACORDEOS DE DETALLES ==========

// const accordionItem = document.querySelectorAll('.details__description-product')

// console.log(accordionItem)
// accordionItem.forEach((item) =>{
//   const accordationHeader = item.querySelector('.productDetail__header')

//   if(accordationHeader){
//     accordationHeader.addEventListener('click', ()=>{
//       const openItem = document.querySelector('.accordion-open')
  
//       toggleItem(item)
//       if(openItem && openItem !== item){
//         toggleItem(openItem)
//       }
//     })
//   }else{
//     console.log('No se encontró .productDetail__header dentro de', item);
//   }


  
// })

// const toggleItem = (item) => {
//   const accordationContent = item.querySelector('.productDetail__content')

//   if(item.classList.contains('accordion-open')){
//     accordationContent.removeAttribute('style')
//     item.classList.remove('accordion-open')
//   }else{
//     accordationContent.style.height = accordationContent.scrollHeight + 'px'
//     item.classList.add('accordion-open')
//   }
  
// }

// }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

// Espera a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', () => {
  // Código para la funcionalidad de filtro (filterMenu)
  // let filterMenu = document.querySelector('.filterMenu');
  // let asideElement = document.querySelector('.main-wrapper aside');
  // let arrowImage = document.querySelector('.listFilter');

  // if (filterMenu && asideElement && arrowImage) {

  //   const originalFlexGrow = window.getComputedStyle(asideElement).flexGrow;
  //     filterMenu.addEventListener('click', () => {
  //         if (asideElement.style.flexGrow === "0") {
  //             asideElement.style.flexGrow = originalFlexGrow; // Regresa al estilo original
  //         } else {
  //             asideElement.style.flexGrow = "0"; // Oculta el asidediemnecion tiene su 
  //         }

  //         arrowImage.classList.toggle('rotated');
  //     });
  // }

  // Código para la funcionalidad del acordeón
  const accordionItems = document.querySelectorAll('.details__description-product');
  if (accordionItems.length > 0) {
      accordionItems.forEach((item) => {
          const accordationHeader = item.querySelector('.productDetail__header');

          if (accordationHeader) {
              accordationHeader.addEventListener('click', () => {
                  const openItem = document.querySelector('.accordion-open');

                  toggleItem(item);
                  if (openItem && openItem !== item) {
                      toggleItem(openItem);
                  }
              });
          } else {
              console.log('No se encontró .productDetail__header dentro de', item);
          }
      });
  }

  // Función para alternar el acordeón
  const toggleItem = (item) => {
      const accordationContent = item.querySelector('.productDetail__content');

      if (item.classList.contains('accordion-open')) {
          accordationContent.removeAttribute('style');
          item.classList.remove('accordion-open');
      } else {
          accordationContent.style.height = accordationContent.scrollHeight + 'px';
          item.classList.add('accordion-open');
      }
  };

  
  const toggleButton = document.getElementById('toggleButton');
  const aside = document.getElementById('filterAside');
  const mainContent = document.getElementById('mainContent');
  const filterIcon = document.querySelector('.listFilterIcon'); // Selecciona el ícono para rotarlo
  
  if (toggleButton && aside && mainContent) {
      toggleButton.addEventListener('click', () => {
          // Evita múltiples clics mientras la animación está en curso
          if (aside.classList.contains('transitioning')) return;
  
          // Añade la clase 'transitioning' para evitar interrupciones
          aside.classList.add('transitioning');
          
          // Alterna las clases 'hidden' y 'active'
          aside.classList.toggle('hidden');
          mainContent.classList.toggle('active');
  
          // Rotación del ícono si está presente
          if (filterIcon) {
              filterIcon.classList.toggle('rotated');
          }
  
          // Remueve la clase 'transitioning' al terminar la animación
          const transitionDuration = parseFloat(getComputedStyle(aside).transitionDuration) * 600; // Convierte segundos a milisegundos
          setTimeout(() => {
              aside.classList.remove('transitioning');
          }, transitionDuration);
      });
  } else {
      console.warn('Uno o más elementos necesarios no están presentes: toggleButton, aside, o mainContent.');
  }



  //FILTRO PRODUCTOS POR PRECIO
  const minPriceRange = document.getElementById('minPrice');
const maxPriceRange = document.getElementById('maxPrice');
const minPriceInput = document.getElementById('minPriceInput');
const maxPriceInput = document.getElementById('maxPriceInput');

const updateSlider = () => {
    const minVal = parseInt(minPriceRange.value);
    const maxVal = parseInt(maxPriceRange.value);

    if (minVal >= maxVal) {
        minPriceRange.value = maxVal - 1;
    }

    minPriceInput.value = minPriceRange.value;
    maxPriceInput.value = maxPriceRange.value;
};

const updateInputs = () => {
    const minVal = parseInt(minPriceInput.value);
    const maxVal = parseInt(maxPriceInput.value);

    if (minVal >= maxVal) {
        minPriceInput.value = maxVal - 1;
    }

    minPriceRange.value = minPriceInput.value;
    maxPriceRange.value = maxPriceInput.value;
};

// Eventos para sincronizar sliders y campos
minPriceRange.addEventListener('input', updateSlider);
maxPriceRange.addEventListener('input', updateSlider);
minPriceInput.addEventListener('input', updateInputs);
maxPriceInput.addEventListener('input', updateInputs);



});

// PAGINA DE NOSOTROS ()

//name
window.sr = ScrollReveal()
sr.reveal('.about__name',{
  duration: 1000,
  viewFactor: 0.1,
  origin: 'bottom',
  distance: '100px',
  delay: 100,
  easing: 'cubic-bezier(0.680, -0.550, 0.265, 1.550)'
})
//title
sr.reveal('.about__title',{
  duration: 1000,
  viewFactor: 0.1,
  origin: 'bottom',
  distance: '100px',
  delay: 200,
  easing: 'cubic-bezier(0.680, -0.550, 0.265, 1.550)'
})
//about__subtitle
sr.reveal('.about__subtitle',{
  duration: 1000,
  viewFactor: 0.1,
  origin: 'bottom',
  distance: '100px',
  delay: 300,
  easing: 'cubic-bezier(0.680, -0.550, 0.265, 1.550)'
})

//about__paragraph
sr.reveal('.about__paragraph',{
  duration: 1000,
  viewFactor: 0.1,
  origin: 'bottom',
  distance: '100px',
  delay: 400,
  easing: 'cubic-bezier(0.680, -0.550, 0.265, 1.550)'
})

//animation images
sr.reveal('.about__images',{
  duration: 1000,
  viewFactor: 0.1,
  origin: 'bottom',
  distance: '100px',
  delay: 700,
  easing: 'cubic-bezier(0.680, -0.550, 0.265, 1.550)'
})








