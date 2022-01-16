import tippy from 'tippy.js'

class Popover {
  constructor(el, template) {
    const templateEl = document.getElementById(template)

    if (templateEl) {
      tippy(el, {
        allowHTML: true,
        content: templateEl.innerHTML,
      })
    }
  }
}

export default Popover
