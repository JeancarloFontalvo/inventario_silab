<?php

namespace app\models;

use Yii;
use app\components\core as AppCore;
use app\modules\inventario\models as InventarioModels;
/**
 * This is the model class for table "TBL_DETALLESOLICITUDES".
 *
 * @property integer $DESO_ID
 * @property double $DESO_CANTIDAD
 * @property integer $SOLI_ID
 * @property integer $STOC_ID
 * @property boolean $DESO_VALIDO
 *
 * @property TBLSOLICITUDES $sTOC
 * @property TBLSTOCK $sTOC0
 */
class DetalleSolicitud extends \yii\db\ActiveRecord implements AppCore\IdentificableInterface
{
    const SCENARIO_ORDER    = 'order';
    const SCENARIO_DEFAULT  = 'default';
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'TBL_DETALLESOLICITUDES';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['DESO_CANTIDAD'], 'number'],
            [['SOLI_ID', 'STOC_ID'], 'required'],
            [['SOLI_ID', 'STOC_ID'], 'integer'],
            [['DESO_VALIDO'], 'boolean'],
            [
                ['SOLI_ID'], 'exist', 
                'skipOnError'       => true, 
                'targetClass'       => Solicitud::className(), 
                'targetAttribute'   => ['STOC_ID' => 'SOLI_ID'], 
                'on'                => self::SCENARIO_DEFAULT
            ],
            [['STOC_ID'], 'exist', 'skipOnError' => true, 'targetClass' => InventarioModels\Stock::className(), 'targetAttribute' => ['STOC_ID' => 'STOC_ID']],
        ];
    }

    public function getId() {
        return $this->DESO_ID;
    }
    public function setId($value = '') {
         $this->DESO_ID = $value;
    }

    public function setDefaultScenario() {
         $this->scenario = self::SCENARIO_DEFAULT;
    }

    public function scenarios()
    {
        $scenarios = parent::scenarios();
        $scenarios[ self::SCENARIO_ORDER ]   = [ "DESO_CANTIDAD", "STOC_ID", "DESO_VALIDO" ];
        $scenarios[ self::SCENARIO_DEFAULT ] = [ "DESO_CANTIDAD", "STOC_ID", "DESO_VALIDO", "SOLI_ID" ];

        return $scenarios;
    }

    public function init() 
    {
        parent::init();
        
        $this->scenario = SELF::SCENARIO_ORDER;
    }


    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'DESO_ID' => 'ID',
            'DESO_CANTIDAD' => 'CANTIDAD',
            'SOLI_ID' => 'SOLICITUD',
            'STOC_ID' => 'STOCK',
            'DESO_VALIDO' => 'VALIDO',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSolicitud()
    {
        return $this->hasOne(Solicitud::className(), ['SOLI_ID' => 'STOC_ID']);
    }

    public function getItem() {
        return $this->stock->item;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStock()
    {
        return $this->hasOne(InventarioModels\Stock::className(), ['STOC_ID' => 'STOC_ID']);
    }

    /**
    * Add and item to details of order and preview the stock for the item
    * @param $item intero
    */
    public function add($item, $laboratory, $inferInventory = true)
    {
        // Not Implemented exception
        throw new Exception(); 
    }
}
