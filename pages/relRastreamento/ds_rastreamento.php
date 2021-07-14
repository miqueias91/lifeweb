<?php

$filtro = '';

if(!empty($_REQUEST['nome'])) {
    $filtro = "AND ( v.placa LIKE '%{$_REQUEST['nome']}%' OR f.nome LIKE '%{$_REQUEST['nome']}%' OR r.data LIKE '%{$_REQUEST['nome']}%' ) ";
}

$db = new Database();

if($db->connect()) {

    $dados = $db->sqlQueryArray(
        "SELECT
            v.placa,
            f.nome,
            r.data,
            v.vel_maxima,
            r.vel_registrada,
            CONCAT(ROUND ((((r.vel_registrada * 100)/v.vel_maxima) - 100),2),'%') diff,
            r.latitude,
            r.longitude
        FROM rastreamento r
        INNER JOIN funcionario f ON f.id = r.funcionario_id
        INNER JOIN funcao fc ON fc.id = f.funcao_id
        INNER JOIN veiculo v ON v.id = r.veiculo_id
        WHERE r.vel_registrada > v.vel_maxima
        {$filtro}"
    );

    echo json_encode(array(
        'status' => 'success',
        'data' => $dados
    ));

} else {
    echo json_encode(array(
        'status' => 'failure',
        'message' => 'Erro ao conectar ao banco'
    ));
}