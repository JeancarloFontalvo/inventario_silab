<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Items */

$this->title = 'Update Items: ' . $model->ITEM_ID;
$this->params['breadcrumbs'][] = ['label' => 'Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ITEM_ID, 'url' => ['view', 'id' => $model->ITEM_ID]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="items-update content card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'item' => $item,
        'itemId' => $itemId
    ]) ?>

</div>
