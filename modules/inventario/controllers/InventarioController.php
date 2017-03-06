<?php

namespace app\modules\inventario\controllers;

use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\VerbFilter;
use yii\helpers\Url;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

use app\modules\inventario\models\Inventario;
use app\modules\inventario\models\InventarioSearch;
use app\modules\inventario\models\views\VStockActual;


/**
 * InventarioController implements the CRUD actions for Inventario model.
 */
class InventarioController extends Controller
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
     * Lists all Inventario models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new InventarioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Inventario model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id, $partial = false, $laboratory = "")
    {
        $model        = $this->findModel($id);
        $query        = VStockActual::getInventoryStock($id, $laboratory, true);
        $dataProvider = new ActiveDataProvider([
                            'query' => $query,
                            'pagination' => [
                                'pageSize' => 4,
                            ],
                        ]);
        $render       = "";

        if( is_numeric($laboratory) ) {
            $model->LABO_ID = $laboratory;
        }

        if(!$partial)
            $render = $this->render('view', [
                'model'         => $model,
                'dataProvider'  => $dataProvider
            ]);
        else 
            $render = $this->renderAjax('view', [
                'model'         => $model,
                'dataProvider'  => $dataProvider
            ]);

        return $render;
    }

    /**
     * Creates a new Inventario model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model      = new Inventario();
        $request    = \Yii::$app->request;
        $data       = $request->post();

        if ($model->load($data, 'Inventario')) 
        {
            $model->INVE_ESSINGLETON = isset($data["Inventario"][ "INVE_ESSINGLETON" ]);

            if($model->INVE_ESSINGLETON)
            {
                $model->LABO_ID = null;
            }

            if($model->save())
                return $this->redirect(['view', 'id' => $model->INVE_ID]);

        } 
        else 
        {
            $labId = $request->getQueryParam("lab");

            if(is_numeric($labId))
            {   
                $tempModel = new Inventario();

                $tempModel->LABO_ID = $labId;
                $isValid            = $tempModel->validate( [ "LABO_ID" ] );

                if($isValid)
                    $model->LABO_ID = $labId;   

                $this->view->params[ "labo.readonly" ] = $isValid ? true : false;
            }

            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    public function actionAdd()
    {
        $model  = new Inventario();
        $return = [
            'message'   => "Se agregó el inventario",
            'location'  => null,
            'status'    => 0
        ];
        
        if ($model->load(Yii::$app->request->post(), 'Inventario') && $model->save()) 
        {
            $return[ 'location' ] = Url::toRoute(['view', 'id' => $model->INVE_ID]);
        } 
        else 
        {
            $return[ "message" ] = $model->getErrors();
        }
    }

    /**
     * Updates an existing Inventario model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model      = $this->findModel($id);
        $request    = \Yii::$app->request;
        $data       = $request->post();
        
        if ($model->load($data, 'Inventario')) 
        {
            $model->INVE_ESSINGLETON = isset($data["Inventario"][ "INVE_ESSINGLETON" ]);

            if($model->INVE_ESSINGLETON)
            {
                $model->LABO_ID = null;
            }

            if($model->validate())
            {
                if($model->save())
                    return $this->redirect(['view', 'id' => $model->INVE_ID]);
            }
        } 
        else 
        {
            $labId = $request->getQueryParam("lab");

            if(is_numeric($labId))
            {
                $tempModel = new Inventario();

                $tempModel->LABO_ID = $labId;
                $isValid            = $tempModel->validate( [ "LABO_ID" ] );
                
                if($isValid)
                    $model->LABO_ID = $labId;

                $this->view->params[ "labo.readonly" ] = $isValid;
            }

            return $this->render('update', [
                'model' => $model,
            ]);
        }
        
    }

    /**
     * Deletes an existing Inventario model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id, $fromLaboratory = false)
    {
        $this->findModel($id)->delete();
        if(!$fromLaboratory)
            return $this->redirect(['index']);
        else
            return $this->goBack((!empty(Yii::$app->request->referrer) ? Yii::$app->request->referrer : null));
    }

    /**
     * Finds the Inventario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Inventario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Inventario::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function summaryInventory($id)
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
    }
}
