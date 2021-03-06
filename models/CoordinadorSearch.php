<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Coordinador;

/**
 * CoordinadorSearch represents the model behind the search form about `app\models\Coordinador`.
 */
class CoordinadorSearch extends Coordinador
{
    /**
     * @inheritdoc
     */
    public $Nombre;
    public $Identificacion;
    public function rules()
    {
        return [
            [['COOR_ID', 'PERS_ID','Identificacion'], 'integer'],
             [['Nombre'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Coordinador::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([

            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
             $query->joinWith("persona");
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'COOR_ID' => $this->COOR_ID,
            'PERS_ID' => $this->PERS_ID,
            //'Identificacion' => $this->PERS_IDENTIFICACION,
        ]);

        $query->joinWith(['persona' => function ($q) {
            $q->where('PERS_NOMBRE LIKE "%' . $this->Nombre . '%"');
        }]);
        $query->joinWith(['persona' => function ($q) {
            $q->where('PERS_IDENTIFICACION LIKE "%' . $this->Identificacion . '%"');
        }]);

        return $dataProvider;
    }
}
