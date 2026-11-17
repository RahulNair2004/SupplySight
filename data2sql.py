import pandas as pd
from sqlalchemy import create_engine
import urllib.parse

# 1. Load your dataset
df = pd.read_csv(r"C:\Users\Rahul\Desktop\Data_SCM\SupplySight\data\DataCoSupplyChainDataset.csv", encoding='latin1')

password = urllib.parse.quote_plus("rahul2004")
engine = create_engine(f"postgresql://postgres:{password}@localhost:5432/SupplySight")

# 3. Upload to PostgreSQL (using lowercase 'dataco' so you don't need double quotes in SQL later)
df.to_sql('dataco', engine, if_exists='replace', index=False, chunksize=5000)

print("Upload complete!")
