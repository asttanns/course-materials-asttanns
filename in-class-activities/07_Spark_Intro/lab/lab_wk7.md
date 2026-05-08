## Lab 7 - PySpark

### 1. Launch an EMR Cluster
```bash
python launch_spark_cluster.py \
    --s3_bucket "$S3_BUCKET" \
    --primary_count 1 \
    --core_count 2 \
    --instance_type "m5.xlarge"
```

- While waiting for the EMR Cluster to launch, please complete the exercises below, save as python files, run them on Midway 3.

The sbatch file for submitting the job and running on Midway:
```bash
#!/bin/bash

#SBATCH --job-name=spark-example
#SBATCH --output=spark.out
#SBATCH --error=spark.err
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --mem=40G
#SBATCH --partition=caslake
#SBATCH --account=macs30123

module load python/anaconda-2022.05 spark/3.3.2

export PYSPARK_DRIVER_PYTHON=/software/python-anaconda-2022.05-el8-x86_64/bin/python3
export PYSPARK_PYTHON=/software/python-anaconda-2022.05-el8-x86_64/bin/python3

spark-submit --total-executor-cores 9 --executor-memory 4G --driver-memory 4G YOUR_FILE.py
```


### 2. PySpark Exercises

- Ex1. Basic Functions

    - Complete the script in [this python file](./lab_wk7_spark.py) that processes and analyzes a dataset containing political speeches to identify and count the occurrences of certain policy-related keywords.
        - Filter the speeches, extract keywords and map, and reduce by key
        - Expected output: [('Politician Name 1', count), ('Politician Name 2', count)]

- Ex2. Spark SQL
    - Complete code in [this notebook](./lab_wk7_sparksql.ipynb)


