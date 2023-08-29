import consumer from "./consumer"

consumer.subscriptions.create("NegotiationPeriodCalculatorChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    // document.getElementById('my-div').innerHTML = "Conectado"
  },

  disconnected(data) {
    // Called when the subscription has been terminated by the server
    const html = `<div class="flex justify-between mb-1">
                    <span class="text-base font-medium ">Recalculando Períodos</span>
                    <span class="text-sm font-medium ">${data.job.count} de ${data.job.total}</span>
                  </div>
                  <div class="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
                    <div class="bg-green-600 h-2.5 rounded-full" style="width: 100%"></div>
                  </div>`;
    document.getElementById('progress').innerHTML = html;
    alert('Períodos recalculados com sucesso!')
    window.location.href = '/app/clients'
  },

  received(data) {
    if (data.job) {
      const job = data.job;
      const count = job.count;
      const total = job.total;
      const progress = job.progress;
      const html = `<div class="flex justify-between mb-1">
                      <span class="text-base font-medium ">Recalculando Períodos</span>
                      <span class="text-sm font-medium ">${count} de ${total}</span>
                    </div>
                    <div class="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
                      <div class="bg-blue-600 h-2.5 rounded-full" style="width: ${progress}%"></div>
                    </div>`;
      document.getElementById('progress').innerHTML = html;
    }
   
    if (data.job.count == data.job.total){ 
      this.disconnected(data)
    }
  }



});
