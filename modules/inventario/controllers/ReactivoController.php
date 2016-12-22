<?php

namespace app\modules\inventario\controllers;

use Yii;
use app\modules\inventario\models\Items;
use app\modules\inventario\models\TipoItem;
use app\modules\inventario\models\ItemConsumible;
use app\modules\inventario\models\Caducidad;
use app\modules\inventario\models\EstadoConsumible;
use app\modules\inventario\models\Reactivo;
use app\modules\inventario\models\ReactivoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ReactivoController implements the CRUD actions for Reactivo model.
 */
class ReactivoController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Reactivo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ReactivoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Reactivo model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Reactivo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $reactivo       = new Reactivo();
        $itemConsumible = new ItemConsumible();
        $item           = new Items();

        if ($item->load(Yii::$app->request->post(), 'Items') && $item->save()) {
            
            if($reactivo->load(Yii::$app->request->post(), 'Reactivo'))
            {
                $itemConsumible->ITEM_ID = $item->id;
                $itemConsumible->ESCO_ID = EstadoConsumible::Agotado;

                if($itemConsumible->save())
                {   
                    $reactivo->ITCO_ID = $itemConsumible->ITCO_ID;
                    $reactivo->CADU_ID = Caducidad::getCaducado( $reactivo->REAC_FECHA_VENCIMIENTO )->CADU_ID;
                    
                    if($reactivo->save())
                    {
                        return $this->redirect(['view', 'id' => $reactivo->id]);
                    }
                }
            }
        } 
        
        $item->TIIT_ID = TipoItem::Reactivo;

        return $this->render('/items/create', [
            'model' => $item
        ]);
        
    }

    /**
     * Updates an existing Reactivo model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $reactivo       = $this->findModel($id);
        $itemConsumible = $reactivo->itemConsumible;
        $item           = $itemConsumible->item;

        if ($item->load(Yii::$app->request->post(), 'Items') && $item->save()) {
            
            if($reactivo->load(Yii::$app->request->post(), 'Reactivo'))
            {
                $itemConsumible->ITEM_ID = $item->id;
                $itemConsumible->ESCO_ID = EstadoConsumible::Agotado;

                if($itemConsumible->save())
                {   
                    $reactivo->ITCO_ID = $itemConsumible->ITCO_ID;
                    $reactivo->CADU_ID = Caducidad::getCaducado( $reactivo->REAC_FECHA_VENCIMIENTO )->CADU_ID;
                    
                    if($reactivo->save())
                    {
                        return $this->redirect(['view', 'id' => $reactivo->id]);
                    }
                }
            }
        } 
        
        $item->TIIT_ID = TipoItem::Reactivo;

        return $this->render('/items/update', [
            'model'     => $item,
            'itemId'    => $id
        ]);
    }

    /**
     * Deletes an existing Reactivo model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Reactivo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Reactivo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Reactivo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
