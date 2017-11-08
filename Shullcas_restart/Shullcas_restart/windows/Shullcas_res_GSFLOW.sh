pwd0=`pwd` 
cd /media/gcng/STORAGE3A/GSFLOW/Shullcas_CrystalLauren5_works_res/control

echo Running GSFLOW in /media/gcng/STORAGE3A/GSFLOW/Shullcas_CrystalLauren5_works_res: 
echo '/home/gcng/workspace/Models/GSFLOW/GSFLOW_1.2.0_gcng/bin/gsflow Shullcas_res_GSFLOW.control &> out.txt' 

/home/gcng/workspace/Models/GSFLOW/GSFLOW_1.2.0_gcng/bin/gsflow Shullcas_res_GSFLOW.control &> out.txt

cd $pwd0 
