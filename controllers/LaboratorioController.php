<?php

namespace app\controllers;

use Yii;
use app\models\Laboratorio;
use app\models\LaboratorioSearch;
use app\models\FuncionarioLaboratorio;
use app\models\FuncionarioLaboratorioSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * LaboratorioController implements the CRUD actions for Laboratorio model.
 */
class LaboratorioController extends Controller
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
     * Lists all Laboratorio models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new LaboratorioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Laboratorio model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {

        $searchModel = new FuncionarioLaboratorioSearch();
        // manda a buscar todos los funconarios que pertenezcan a un laboratorio en especifico
        $dataProvider = $searchModel->search2($id);
        return $this->render('view', [
            'model' => $this->findModel($id),
             'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new Laboratorio model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {

        //1. delclaran objetos de cada uno de los modelos 
        $modelLaboratorio = new Laboratorio();
        $modelLabFuncionario= new FuncionarioLaboratorio;

        //2.se  valida de que si e modelo del laboratorio esta cargado
        if ($modelLaboratorio->load(Yii::$app->request->post())) 
        {
            //2.1 guarda los  datos del laboratorio en la base de datos    
            $modelLaboratorio->save();

            return $this->redirect(['funcionario-laboratorio/create', 'idLaboratorio' => $modelLaboratorio->LABO_ID]);
        } else {
            return $this->render('create', [
                'model' => $modelLaboratorio,
            ]);
        }
    }

    /**
     * Updates an existing Laboratorio model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->LABO_ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Laboratorio model.
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
     * Finds the Laboratorio model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Laboratorio the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Laboratorio::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
