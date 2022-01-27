<?php
    class Curso extends Conectar{

        public function insert_curso($cat_id,$cur_nom,$cur_descrip,$cur_fechini,$cur_fechfin,$inst_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO tm_curso (cur_id, cat_id, cur_nom, cur_descrip, cur_fechini, cur_fechfin, inst_id,cur_img, fech_crea, est) VALUES (NULL,?,?,?,?,?,?,'../../public/1.png', now(),'1');";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $cat_id);
            $sql->bindValue(2, $cur_nom);
            $sql->bindValue(3, $cur_descrip);
            $sql->bindValue(4, $cur_fechini);
            $sql->bindValue(5, $cur_fechfin);
            $sql->bindValue(6, $inst_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function update_curso($cur_id,$cat_id,$cur_nom,$cur_descrip,$cur_fechini,$cur_fechfin,$inst_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE tm_curso
                SET
                    cat_id =?,
                    cur_nom = ?,
                    cur_descrip = ?,
                    cur_fechini = ?,
                    cur_fechfin = ?,
                    inst_id = ?
                WHERE
                    cur_id = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $cat_id);
            $sql->bindValue(2, $cur_nom);
            $sql->bindValue(3, $cur_descrip);
            $sql->bindValue(4, $cur_fechini);
            $sql->bindValue(5, $cur_fechfin);
            $sql->bindValue(6, $inst_id);
            $sql->bindValue(7, $cur_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function delete_curso($cur_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE tm_curso
                SET
                    est = 0
                WHERE
                    cur_id = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $cur_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function get_curso(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT
                tm_curso.cur_id,
                tm_curso.cur_nom,
                tm_curso.cur_descrip,
                tm_curso.cur_fechini,
                tm_curso.cur_fechfin,
                tm_curso.cat_id,
                tm_curso.cur_img,
                tm_categoria.cat_nom,
                tm_curso.inst_id,
                tm_instructor.inst_nom,
                tm_instructor.inst_apep,
                tm_instructor.inst_apem,
                tm_instructor.inst_correo,
                tm_instructor.inst_sex,
                tm_instructor.inst_telf
                FROM tm_curso
                INNER JOIN tm_categoria on tm_curso.cat_id = tm_categoria.cat_id
                INNER JOIN tm_instructor on tm_curso.inst_id = tm_instructor.inst_id
                WHERE tm_curso.est = 1";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function get_curso_id($cur_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM tm_curso WHERE est = 1 AND cur_id = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $cur_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function delete_curso_usuario($curd_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE td_curso_usuario
                SET
                    est = 0
                WHERE
                    curd_id = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $curd_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        /*TODO: Insert Curso por Usuario */
        public function insert_curso_usuario($cur_id,$usu_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO td_curso_usuario (curd_id,cur_id,usu_id,fech_crea,est) VALUES (NULL,?,?,now(),1);";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $cur_id);
            $sql->bindValue(2, $usu_id);
            $sql->execute();

            $sql1="select last_insert_id() as 'curd_id'";
            $sql1=$conectar->prepare($sql1);
            $sql1->execute();
            return $resultado=$sql1->fetch(pdo::FETCH_ASSOC);
        }

        public function update_imagen_curso($cur_id,$cur_img){
            $conectar= parent::conexion();
            parent::set_names();

            require_once("Curso.php");
            $curx = new Curso();
            $cur_img = '';
            if ($_FILES["cur_img"]["name"]!=''){
                $cur_img = $curx->upload_file();
            }

            $sql="UPDATE tm_curso
                SET
                    cur_img = ?
                WHERE
                    cur_id = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $cur_img);
            $sql->bindValue(2, $cur_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function upload_file(){
            if(isset($_FILES["cur_img"])){
                $extension = explode('.', $_FILES['cur_img']['name']);
                $new_name = rand() . '.' . $extension[1];
                $destination = '../public/' . $new_name;
                move_uploaded_file($_FILES['cur_img']['tmp_name'], $destination);
                return "../../public/".$new_name;
            }
        }
    }
?>