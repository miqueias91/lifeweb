Cmp.RelVeiculo = function() {
    
    var private = {

        render: function() {

            Cmp.createInput({
                id: 'inputPlaca',
                renderTo: '#divInputPlaca',
                label: 'Placa do veículo:'
            });

            Cmp.createButton({
                id: 'btnBuscar',
                renderTo: '#divBtnConsultar',
                text: '<i class="fas fa-search"></i>',
                handler: function() {
                    private.buscar();
                }
            });

            Cmp.createGrid({
                id: 'gridDadosVeiculos',
                renderTo: '#divCmpGridVeiculo',
                header: [
                    {
                        text: 'Nome',
                        field: 'nome'
                    }, {
                        text: 'Placa',
                        field: 'placa',
                        width: 150
                    }, {
                        text: 'Vel. Max.',
                        field: 'vel_maxima',
                        width: 150
                    }
                ]
            });
        },

        buscar: function() {
            Cmp.showLoading();

            Cmp.request({
                url: 'index.php?mdl=relVeiculo&file=ds_veiculo.php',
                params: {
                    placa: Cmp.get('inputPlaca').getValue()
                },
                success: function(res) {
                    Cmp.hideLoading();
                    if(res.status == 'success') {
                        Cmp.get('gridDadosVeiculos').loadData(res.data);
                    } else {
                        Cmp.showErrorMessage(res.message || 'Ocorreu um erro na requisição');
                    }
                }
            });
        }

    };

    this.init = function() {
        private.render();
    }

}