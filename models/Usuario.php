<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "TBL_USUARIOS".
 *
 * @property integer $USUA_ID
 * @property string $USUA_USUARIO
 * @property string $USUA_PASSWORD
 * @property integer $USUA_ES_ACTIVO
 * @property integer $PERS_ID
 * @property integer $ROL_ID
 *
 * @property TBLAUDITORIALOG[] $tBLAUDITORIALOGs
 * @property TBLPERSONAS $pERS
 * @property TBLROLES $rOL
 */
class Usuario extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'TBL_USUARIOS';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['USUA_USUARIO', 'USUA_PASSWORD', 'PERS_ID', 'ROL_ID'], 'required'],
            [['USUA_ES_ACTIVO', 'PERS_ID', 'ROL_ID'], 'integer'],
            [['USUA_USUARIO', 'USUA_PASSWORD'], 'string', 'max' => 45],
            [['PERS_ID'], 'exist', 'skipOnError' => true, 'targetClass' => Persona::className(), 'targetAttribute' => ['PERS_ID' => 'PERS_ID']],
            [['ROL_ID'], 'exist', 'skipOnError' => true, 'targetClass' => Rol::className(), 'targetAttribute' => ['ROL_ID' => 'ROL_ID']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'USUA_ID' => 'Usua  ID',
            'USUA_USUARIO' => 'Usua  Usuario',
            'USUA_PASSWORD' => 'Usua  Password',
            'USUA_ES_ACTIVO' => 'Usua  Es  Activo',
            'PERS_ID' => 'Pers  ID',
            'ROL_ID' => 'Rol  ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuditLogs()
    {
        return $this->hasMany(AuditLog::className(), ['USUA_ID' => 'USUA_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersona()
    {
        return $this->hasOne(Persona::className(), ['PERS_ID' => 'PERS_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRol()
    {
        return $this->hasOne(Rol::className(), ['ROL_ID' => 'ROL_ID']);
    }
    
    public function getUsername()
    {
        return $this->USUA_USUARIO;
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne(['login_id' => $id]);
    }

    /*
        - - - - - - - - - - - - - - - - - - - - - - - - 
        Login and user Identity interface implementatio
        - - - - - - - - - - - - - - - - - - - - - - - - 
    */
    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['login_key' => $token]);
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['login_username' => $username]);
    }

    /**
     * Finds user by username and password
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsernameAndPassword($username, $password)
    {
        return static::findOne(['login_username' => $username, 'login_password' => $password]);
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->login_id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->login_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->login_key === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->login_password === $password;
    }


    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->login_password   = md5( $this->login_password );
                $this->login_key        = \Yii::$app->security->generateRandomString();
            }
            return true;
        }
        return false;
    }

    // Get permissions for the user and from the database
    public static function getUserPermissions($params = null)
    {
        if(isset($params))
        {
            $id     = $params[ "id" ];
            $role   = $params[ "role" ];

            if(!isset($role) && isset($id))
                return \app\models\Permission::find(['login_id' => $id])
                ->innerJoinWith("groups g")
                ->innerJoinWith("groups.userRole u")
                ->innerJoinWith("groups.userRole.loginAccounts la")
                ->where(['la.login_id' => $id])->all();
            else
                return \app\models\Permission::find()
                ->innerJoinWith("groups g")
                ->innerJoinWith("groups.userRole u")
                ->where(['u.userRole_name' => $role])->all();
        }

        return null;
    }

    // Get permissions for the user and from the database
    public static function userCan($params = null)
    {
        if(isset($params))
        {
            $id     = $params[ "id" ];
            $roleId = $params[ "role-id" ];
            $action = $params[ "action" ];

            if(!isset($role) && isset($id))
                return \app\models\Permission::find()
                //->innerJoinWith("groups.userRole u")
                ->innerJoinWith("groups.userRole.loginAccounts")
                ->where(['login_id' => $id, 'permission_name' => $action])->one();
        }

        return null;
    }

    public function can($role)
    {
        return strtolower($this->userRole->userRole_name) === strtolower($role);
    }
}
