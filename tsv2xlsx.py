import csv
import os,sys
from xlsxwriter.workbook import Workbook

def tsv_to_xlsx(tsv_path_name):
    tsv_file = tsv_path_name
    xlsx_file = os.path.splitext(tsv_path_name)[0] + ".xlsx"

    workbook = Workbook(xlsx_file)
    worksheet = workbook.add_worksheet()

    tsv_reader = csv.reader(open(tsv_file,"rt"), delimiter = "\t")

    for row, data in enumerate(tsv_reader):
        worksheet.write_row(row, 0, data)

    workbook.close()    


tsv_file = sys.argv[1]
tsv_to_xlsx(tsv_file)