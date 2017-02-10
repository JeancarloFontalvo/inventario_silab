<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Equipo */
/* @var $form yii\widgets\ActiveForm */
?>
<?php 
    // variable para imprimir el boton tambien
    $submitButton       = (isset($submitButton))    ? $submitButton : true;  
    $isJustLoad         = (isset($isJustLoad))      ? $isJustLoad   : false;
    $item               = $model->item;
    $itemNoConsumible   = $model->parent;

    $actionConfig       = [ $model->isNewRecord ? "create" : "update", "returnUrl" => ( isset($returnUrl) ?  $returnUrl : "" )];
    
    if( $model->id )
        $actionConfig[ "id" ] = $model->id;

    $action         = Url::toRoute( $actionConfig );

?>
<div class="equipo-form">

    <?php $form = ActiveForm::begin(["action" => $action, "id" => "item-team-form"]); ?>

    <?php 
        require Yii::getAlias("@inventarioViews").'/item-no-consumible/_form-fields.php';
    ?>

    <?= $form->field($model, 'EQUI_SERIAL')->textInput(['maxlength' => true]) ?>

    <?// $form->field($model, 'ITNC_ID')->textInput() ?>

    <?php if($submitButton): ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php endIf; ?>

    <?php ActiveForm::end(); ?>

</div>
