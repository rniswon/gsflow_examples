pwd0=`pwd` 
cd /media/gcng/STORAGE3A/GSFLOW/Shullcas_CrystalLauren5_works/control

echo Running GSFLOW in /media/gcng/STORAGE3A/GSFLOW/Shullcas_CrystalLauren5_works: 
echo '/home/gcng/workspace/Models/GSFLOW/GSFLOW_1.2.0_gcng/bin/gsflow Shullcas_GSFLOW.control &> out.txt' 

/home/gcng/workspace/Models/GSFLOW/GSFLOW_1.2.0_gcng/bin/gsflow Shullcas_GSFLOW.control &> out.txt

cd $pwd0 
