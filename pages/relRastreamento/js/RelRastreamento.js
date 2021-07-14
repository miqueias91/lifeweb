Cmp.RelRastreamento = function() {
    
    var private = {

        render: function() {

            Cmp.createInput({
                id: 'inputNome',
                renderTo: '#divInputNome',
                label: 'Placa, nome do funcionário ou data de ocorrência:'
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
                id: 'gridDadosRastreamento',
                renderTo: '#divCmpGridRastreamento',
                header: [
                    {
                        text: 'Placa',
                        field: 'placa'
                    }, 
                    {
                        text: 'Funcionário',
                        field: 'nome'
                    }, 
                    {
                        text: 'Data de Ocorrência',
                        field: 'data'
                    },
                    {
                        text: 'Vel. Max.',
                        field: 'vel_maxima',
                        width: 50
                    },
                    {
                        text: 'Vel. Reg.',
                        field: 'vel_registrada',
                        width: 50
                    },
                    {
                        text: 'Diff. Vel.',
                        field: 'diff',
                        width: 50
                    },
                    {
                        text: 'Latitude',
                        field: 'latitude'
                    },
                    {
                        text: 'Longitude',
                        field: 'longitude'
                    }
                ]
            });
        },

        buscar: function() {
            Cmp.showLoading();

            Cmp.request({
                url: 'index.php?mdl=relRastreamento&file=ds_rastreamento.php',
                params: {
                    nome: Cmp.get('inputNome').getValue()
                },
                success: function(res) {
                    Cmp.hideLoading();
                    if(res.status == 'success') {
                        Cmp.get('gridDadosRastreamento').loadData(res.data);
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