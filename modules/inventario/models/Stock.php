<?php

namespace app\modules\inventario\models;

use Yii;
use app\modules\inventario\models\core\Items;
use app\models\Periodo;
/**
 * This is the model class for table "TBL_STOCK".
 *
 * @property integer $STOC_ID
 * @property integer $ITEM_ID
 * @property integer $INVE_ID
 * @property double $STOC_CANTIDAD
 *
 * @property TBLFLUJOS[] $tBLFLUJOSs
 * @property TBLINVENTARIOS $iNVE
 * @property TBLITEMS $iTEM
 */
class Stock extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'TBL_STOCK';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ITEM_ID', 'INVE_ID', 'STOC_CANTIDAD', 'PERI_ID'], 'required'],
            [['ITEM_ID', 'INVE_ID', 'PERI_ID'], 'integer'],
            [['STOC_CANTIDAD'], 'number'],
            [['INVE_ID', 'ITEM_ID', 'PERI_ID'], 'unique', 'targetAttribute' => ['INVE_ID', 'ITEM_ID', 'PERI_ID'], 'message' => 'La combinacion ya existe.'],
            [['INVE_ID'], 'exist', 'skipOnError' => true, 'targetClass' => Inventario::className(), 'targetAttribute' => ['INVE_ID' => 'INVE_ID']],
            [['ITEM_ID'], 'exist', 'skipOnError' => true, 'targetClass' => Items::className(), 'targetAttribute' => ['ITEM_ID' => 'ITEM_ID']],
            [['PERI_ID'], 'exist', 'skipOnError' => true, 'targetClass' => Periodo::className(), 'targetAttribute' => ['PERI_ID' => 'PERI_ID']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'STOC_ID' => 'STOCK',
            'ITEM_ID' => 'ITEM',
            'INVE_ID' => 'INVENTARIO',
            'STOC_CANTIDAD' => 'CANTIDAD',
            'PERI_ID'       => 'PERIODO',
        ];
    }

    public function getId() {
        return $this->STOC_ID;
    }
    public function setId($value = '') {
         $this->STOC_ID = $value;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFlujos()
    {
        return $this->hasMany(Flujo::className(), ['STOC_ID' => 'STOC_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInventario()
    {
        return $this->hasOne(Inventario::className(), ['INVE_ID' => 'INVE_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItem()
    {
        return $this->hasOne(Items::className(), ['ITEM_ID' => 'ITEM_ID']);
    }

    /**
    * @return \yii\db\ActiveQuery
    */
   public function getPeriodo()
   {
       return $this->hasOne(Periodo::className(), ['PERI_ID' => 'PERI_ID']);
   }

   public static function getCurrentStock($item, $inventory)
   {
        $stock = static::find()
                ->where([ "ITEM_ID" => $item, 'INVE_ID' => $inventory ])
                ->limit(1)
                ->orderBy('STOC_ID DESC')
                ->one();

        return $stock;
   }

   public function calculateAmount()
   {
       $flows = $this->flujos;

       $amount = $this->STOC_CANTIDAD;

       if(count($flows) > 0)
       {
           $amount = 0;
           foreach($flows as $flow)
           {
               $amount += $flow->FLUJ_CANTIDAD * ( $flow->tipoFlujo->TIFL_CONSTANTE );
           }
       }
       
       return $amount;
   }

}
