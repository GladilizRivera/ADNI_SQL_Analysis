-- ADNI Biomarker SQL Analysis
-- Author: Gladiliz Rivera
-- Description: Analysis of Alzheimer's disease biomarkers using ADNI data
-- Source: upennbiomk10 and adnimerge tables

-- ----------------------------
-- Table Schemas
-- ----------------------------

CREATE TABLE upennbiomk10 (
    RID INT,
    VISCODE VARCHAR(10),
    VISCODE2 VARCHAR(10),
    DRAWDATE DATE,
    RUNDATE DATE,
    ABETA40 FLOAT,
    ABETA42 FLOAT,
    PTAU FLOAT,
    TAU FLOAT,
    NOTE TEXT,
    update_stamp DATETIME,
    PRIMARY KEY (RID, VISCODE)
);

CREATE TABLE adnimerge (
  RID INT,
  VISCODE VARCHAR(10),
  EXAMDATE DATE,
  DX_bl VARCHAR(20),
  DX VARCHAR(20),
  MMSE FLOAT,
  AGE FLOAT,
  PTGENDER VARCHAR(10),
  PTEDUCAT INT,
  APOE4 INT,
  update_stamp DATETIME,
  PRIMARY KEY (RID, VISCODE)
);

-- ----------------------------
-- Core Analysis Queries
-- ----------------------------

-- 1. Biomarker averages by diagnosis
SELECT 
  a.DX_bl AS diagnosis,
  COUNT(*) AS n,
  ROUND(AVG(m.ABETA42), 2) AS avg_abeta42,
  ROUND(STDDEV(m.ABETA42), 2) AS sd_abeta42,
  ROUND(AVG(m.TAU), 2) AS avg_tau,
  ROUND(AVG(m.PTAU), 2) AS avg_ptau
FROM upennbiomk10 AS m
JOIN adnimerge AS a ON m.RID = a.RID AND TRIM(m.VISCODE) = TRIM(a.VISCODE)
WHERE m.ABETA42 IS NOT NULL AND m.TAU IS NOT NULL AND m.PTAU IS NOT NULL
GROUP BY a.DX_bl;

-- 2. Biomarkers vs. MMSE
SELECT 
  m.ABETA42,
  m.TAU,
  m.PTAU,
  a.MMSE
FROM upennbiomk10 AS m
JOIN adnimerge AS a ON m.RID = a.RID AND TRIM(m.VISCODE) = TRIM(a.VISCODE)
WHERE m.ABETA42 IS NOT NULL AND a.MMSE IS NOT NULL;

-- 3. APOE4 distribution by baseline diagnosis
SELECT 
  a.APOE4,
  a.DX_bl,
  COUNT(*) AS count
FROM adnimerge a
WHERE a.APOE4 IS NOT NULL
GROUP BY a.APOE4, a.DX_bl
ORDER BY a.APOE4, a.DX_bl;

-- 4. Comprehensive biomarker, demographic, and genetic summary by diagnosis
SELECT 
  a.DX_bl AS diagnosis,
  COUNT(*) AS n,
  ROUND(AVG(m.ABETA42), 2) AS avg_abeta42,
  ROUND(STDDEV(m.ABETA42), 2) AS sd_abeta42,
  ROUND(AVG(m.TAU), 2) AS avg_tau,
  ROUND(STDDEV(m.TAU), 2) AS sd_tau,
  ROUND(AVG(m.PTAU), 2) AS avg_ptau,
  ROUND(STDDEV(m.PTAU), 2) AS sd_ptau,
  ROUND(AVG(a.AGE), 1) AS avg_age,
  ROUND(AVG(a.MMSE), 2) AS avg_mmse,
  ROUND(SUM(CASE WHEN a.APOE4 >= 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS percent_apoe4_carriers
FROM upennbiomk10 AS m
JOIN adnimerge AS a 
  ON m.RID = a.RID AND TRIM(m.VISCODE) = TRIM(a.VISCODE)
WHERE m.ABETA42 IS NOT NULL AND m.TAU IS NOT NULL AND m.PTAU IS NOT NULL
  AND a.DX_bl IS NOT NULL
GROUP BY a.DX_bl
ORDER BY FIELD(a.DX_bl, 'CN', 'SMC', 'EMCI', 'LMCI', 'AD', 'Dementia');
