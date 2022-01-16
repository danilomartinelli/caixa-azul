import Popover from './popover'

let Hooks = {}

Hooks.Popover = {
  mounted() {
    this.popover = new Popover(this.el, this.el.dataset.template || 'template')
  },
  updated() {},
  destroyed() {},
}

export default Hooks
