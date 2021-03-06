<?php

namespace app\modules\inventario\models;

use Yii;
use app\modules\inventario\models\core\ItemNoConsumible;
/**
 * This is the model class for table "TBL_HERRAMIENTAS".
 *
 * @property integer $HERR_ID
 * @property integer $HERR_CANTIDAD
 * @property integer $ITNC_ID
 *
 * @property TBLITEMSNOCONSUMIBLES $iTNC
 */
class Herramienta extends \app\modules\inventario\models\core\ItemBase
{
    protected static $parentIdProperty   = "ITNC_ID";

    public static function getType()
    {
        return \app\modules\inventario\models\core\TipoItem::Herramienta;
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'TBL_HERRAMIENTAS';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['HERR_CANTIDAD'], 'required'],
            [['HERR_CANTIDAD', 'ITNC_ID'], 'integer'],
            [['ITNC_ID'], 'exist', 'skipOnError' => true, 'targetClass' => ItemNoConsumible::className(), 'targetAttribute' => ['ITNC_ID' => 'ITNC_ID']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'HERR_ID'       => 'ID',
            'HERR_CANTIDAD' => 'CANTIDAD',
            'ITNC_ID'       => 'NO CONSUMIBLE',
        ];
    }

    public function getId() {
        return $this->HERR_ID;
    }
    public function setId($value = '') {
         $this->HERR_ID = $value;
    }

    public function getCantidad() {
        return $this->HERR_CANTIDAD;
    }
    public function setCantidad($value = '') {
         $this->HERR_CANTIDAD = $value;
    }

    public function getItemNoConsumibleId() {
        return $this->ITNC_ID;
    }
    public function setItemNoConsumibleId($value = '') {
         $this->ITNC_ID = $value;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemNoConsumible()
    {
        return $this->hasOne(ItemNoConsumible::className(), ['ITNC_ID' => 'ITNC_ID']);
    }
}
