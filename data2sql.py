import pandas as pd
from sqlalchemy import create_engine
import urllib.parse

# Load your dataset
df = pd.read_csv(r"Dataset.csv", encoding='latin1')

password = urllib.parse.quote_plus("Password")
engine = create_engine(f"postgresql://postgres:{password}@localhost:5432/SupplySight")

# Upload to PostgreSQL 
df.to_sql('dataco', engine, if_exists='replace', index=False, chunksize=5000)

print("Upload complete!")
