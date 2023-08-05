# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.0/flowbite.turbo.min.js"
pin "flowbite-datepicker", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/datepicker.turbo.min.js"
pin "stimulus-notification", to: "https://ga.jspm.io/npm:stimulus-notification@2.2.0/dist/stimulus-notification.mjs"
pin "hotkeys-js", to: "https://ga.jspm.io/npm:hotkeys-js@3.10.4/dist/hotkeys.esm.js"
pin "stimulus-use", to: "https://ga.jspm.io/npm:stimulus-use@0.51.3/dist/index.js"
pin "stimulus-scroll-to", to: "https://ga.jspm.io/npm:stimulus-scroll-to@4.1.0/dist/stimulus-scroll-to.mjs"
pin "stimulus-textarea-autogrow", to: "https://ga.jspm.io/npm:stimulus-textarea-autogrow@4.1.0/dist/stimulus-textarea-autogrow.mjs"
pin "stimulus-reveal-controller", to: "https://ga.jspm.io/npm:stimulus-reveal-controller@4.1.0/dist/stimulus-reveal-controller.mjs"

pin 'plugins/theme-toggle', preload: true
pin 'plugins/aos-init'