<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\EstadoConsumible */

$this->title = 'Create Estado Consumible';
$this->params['breadcrumbs'][] = ['label' => 'Estado Consumibles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="estado-consumible-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
