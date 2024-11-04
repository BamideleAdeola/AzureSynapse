# AzureSynapse
Azure Synapse Analytics is an enterprise analytics service that accelerates time to insight across data warehouses and big data systems. It brings together the best of SQL technologies used in enterprise data warehousing, Apache Spark technologies for big data, and Azure Data Explorer for log and time series analytics.

![image](https://github.com/BamideleAdeola/AzureSynapse/assets/54434309/015e014d-5462-438b-891a-79895c8952b1)

# Azure Synapse Analytics Project with PySpark SQL and Notebooks

This project demonstrates how to leverage **Azure Synapse Analytics** with **PySpark SQL** and **Synapse Notebooks** for efficient data processing, transformation, and analysis. It showcases how Synapse can handle large-scale datasets and integrate seamlessly with other Azure services.

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Features](#features)
- [Setup and Configuration](#setup-and-configuration)
- [Data ANalysis with SQL](https://github.com/BamideleAdeola/AzureSynapse/blob/main/Analyze%20Internet%20Sales.sql) 
- [Querying with PySpark SQL and Visualization](https://github.com/BamideleAdeola/AzureSynapse/blob/main/Apache_Spark_Synapse.ipynb)
- [Synaspe_if_no_header](https://github.com/BamideleAdeola/AzureSynapse/blob/main/synapse_if_no_header_.png)
- [Parquet Data from Synapse](https://github.com/BamideleAdeola/AzureSynapse/blob/main/SQL_to_query_parquet3.png)
- [SQL to Query JSON in Synapse](https://github.com/BamideleAdeola/AzureSynapse/blob/main/SQL_to_query_JSON2.png)

---

## Project Overview

This project utilizes **Azure Synapse Analytics** to perform complex data transformations and analyses on large datasets using **PySpark SQL** in Synapse **Notebooks**. With Synapse's distributed processing capabilities, we can efficiently analyze data at scale and produce actionable insights.

Key goals of this project:
- Use PySpark SQL for data processing and transformation
- Showcase Synapse Notebooks for interactive data exploration
- Integrate with other Azure services (e.g., Data Lake Storage)

## Architecture

![Architecture Diagram](path/to/architecture-diagram.png) <!-- Replace with your actual image path -->

The architecture involves:
1. **Azure Synapse Analytics Workspace** - Centralized platform for data integration, warehousing, and big data analytics.
2. **Azure Data Lake Storage (ADLS)** - For storing raw and processed data.
3. **Synapse Notebooks** - Interactive notebooks for executing PySpark SQL code.
4. **Azure Synapse Pipelines** (optional) - For orchestrating data movement and transformation.

## Features

- **Data Ingestion**: Load data from multiple sources (e.g., ADLS, Blob Storage).
- **Data Transformation**: Perform data cleaning, aggregation, and transformation with PySpark SQL.
- **Exploratory Data Analysis (EDA)**: Interactive analysis using Synapse Notebooks.
- **Data Visualization**: Visualize data trends and distributions directly within notebooks.
- **Scheduling and Automation**: (Optional) Automated workflows using Synapse Pipelines.

## Setup and Configuration

### Prerequisites

- **Azure Subscription**: Ensure you have access to an Azure account with Synapse Analytics resources.
- **Azure Synapse Workspace**: Create a Synapse workspace to execute this project.
- **Azure Data Lake Storage (ADLS)**: Set up a storage account and create containers for storing raw and processed data.



You can follow along using Microsoft exercise documentation below:
https://microsoftlearning.github.io/DP-500-Azure-Data-Analyst/Instructions/labs/01-analyze-data-with-sql.html


