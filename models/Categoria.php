<?php
    class Categoria extends Conectar{

        public function insert_categoria($cat_id,$cur_nom,$cur_descrip,$cur_fechini,$cur_fechfin,$inst_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO tm_curso (cur_id, cat_id, cur_nom, cur_descrip, cur_fechini, cur_fechfin, inst_id, fech_crea, est) VALUES (NULL,?,?,?,?,?,?, now(),'1');";
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

        public function update_categoria($cur_id,$cat_id,$cur_nom,$cur_descrip,$cur_fechini,$cur_fechfin,$inst_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE tm_curso
                SET
                    cat_id =?,
                    cur_nom = ?,
                    cur_descrip = ?,
                    cur_fechini = ?,
                    cur_fechfin = ?
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

        public function delete_categoria($cur_id){
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

        public function get_categoria(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM tm_categoria WHERE est = 1";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function get_categoria_id($cur_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM tm_curso WHERE est = 1 AND cur_id = ?";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $cur_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
    }
?>