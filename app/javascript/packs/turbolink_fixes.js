// document.addEventListener("turbolinks:before-cache", function() {
//     if(document.getElementById('alert')) {
//       document.getElementById('alert').remove();
//     }
// });


// ;(function () {
//     var reloadWithTurbolinks = (function () {
//       var scrollPosition
  
//       function reload () {
//         scrollPosition = [window.scrollX, window.scrollY]
//         Turbolinks.visit(window.location.toString(), { action: 'replace' })
//       }
  
//       window.addEventListener('turbolinks:load', function () {
//         if (scrollPosition) {
//           window.scrollTo.apply(window, scrollPosition)
//           scrollPosition = null
//         }
//       })
  
//       return reload
//     })()
  
//     window.addEventListener('popstate', function () {
//       requestAnimationFrame(reloadWithTurbolinks)
//     })
//   })()

//   const turbolinksPersistScroll = () => {
//     const persistScrollDataAttribute = 'turbolinks-persist-scroll'
//     let scrollPosition = null
//     let enabled = false
  
//     document.addEventListener('turbolinks:before-visit', (event) => {
//       if (enabled)
//         scrollPosition = window.scrollY
//       else
//         scrollPosition = null
//       enabled = false
//     })
  
//     document.addEventListener('turbolinks:load', (event) => {
//       const elements = document.querySelectorAll(`[data-${persistScrollDataAttribute}="true"]`)
//       for (let i = 0; i < elements.length; i++) {
//         elements[i].addEventListener('click', () => {
//           enabled = true
//         })
//       }
  
//       if (scrollPosition)
//         window.scrollTo(0, scrollPosition)
//     })
//   }
  
//   turbolinksPersistScroll()
// //   window.addEventListener('turbolinks:load', function() {
// //     document.querySelector('html').style.scrollBehavior = 'smooth'
// //   });
// //   window.addEventListener('turbolinks:before-visit', function() {
// //     document.querySelector('html').style.scrollBehavior = 'unset'
// //   });

// ;(function () {
//     // Tell the browser not to handle scrolling when restoring via the history or
//     // when reloading
//     if ('scrollRestoration' in history) {
//       history.scrollRestoration = 'manual'
//     }
  
//     var SCROLL_POSITION = 'scroll-position'
//     var PAGE_INVALIDATED = 'page-invalidated'
  
//     // Persist the scroll position on refresh
//     addEventListener('beforeunload', function() {
//       sessionStorage.setItem(SCROLL_POSITION, JSON.stringify(scrollData()))
//     });
  
//     // Invalidate the page when the next page is different from the current page
//     // Persist scroll information across pages
//     document.addEventListener('turbolinks:before-visit', function (event) {
//       if (event.data.url !== location.href) {
//         sessionStorage.setItem(PAGE_INVALIDATED, 'true')
//       }
//       sessionStorage.setItem(SCROLL_POSITION, JSON.stringify(scrollData()))
//     })
  
//     // When a page is fully loaded:
//     // 1. Get the persisted scroll position
//     // 2. If the locations match and the load did not originate from a page
//     // invalidation,
//     // 3. scroll to the persisted position if there, or to the top otherwise
//     // 4. Remove the persisted information
//     addEventListener('turbolinks:load', function (event) {
//       var scrollPosition = JSON.parse(sessionStorage.getItem(SCROLL_POSITION))
  
//       if (shouldScroll(scrollPosition)) {
//         scrollTo(scrollPosition.scrollX, scrollPosition.scrollY)
//       } else {
//         scrollTo(0, 0)
//       }
//       sessionStorage.removeItem(PAGE_INVALIDATED)
//     });
  
//     function shouldScroll(scrollPosition) {
//       return (scrollPosition
//         && scrollPosition.location === location.href
//         && !JSON.parse(sessionStorage.getItem(PAGE_INVALIDATED)))
//     }
  
//     function scrollData() {
//       return {
//         scrollX: scrollX,
//         scrollY: scrollY,
//         location: location.href
//       }
//     }
//   })()