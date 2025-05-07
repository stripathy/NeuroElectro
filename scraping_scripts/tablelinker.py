import os

#### Script used for allowing link redirect from ephys tables

directory = "/Users/hugohudson/NeuroElectro-new/ephys_prop"

old_chunk = """\
function (ev, seriesIndex, pointIndex, data) {
            var data_pt_ind = data[7];
            var linkStr;
            if (data_pt_ind < 0) // this is a hack to redirect non-data table ext data to the article page
            {
                linkStr = "/article/" + (-data_pt_ind);
            }
            else 
            {
                linkStr = "/data_table/" + data_pt_ind;
            }
            window.open(linkStr, '_self');
            
        }
"""

old_chunk_axis = """\
.click(function(){ 
          var neuron_tick_id = $(this).attr('id');
          var linkStr = "/neuron/" + neuron_tick_id;
          window.open(linkStr, '_self');
      })
"""

new_chunk = """\
function (ev, seriesIndex, pointIndex, data) {
            var data_pt_ind = data[7];
            var linkStr;
            if (data_pt_ind < 0) // this is a hack to redirect non-data table ext data to the article page
            {
                linkStr = "/article/ephys_prop/" + (-data_pt_ind)  + ".html";
            }
            else 
            {
                linkStr = "/datatable/ephys_prop/" + data_pt_ind + ".html";
            }
            window.location.href = linkStr;
            
        }
"""

new_chunk_axis = """\
.click(function(){ 
          var neuron_tick_id = $(this).attr('id');
          var linkStr = "/neuron/" + neuron_tick_id + ".html";
          window.location.href = linkStr;
      })
"""

for file_name in os.listdir(directory):            
    path = os.path.join(directory, file_name)           
    if not os.path.isfile(path):
        continue

    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    updated = False

    if old_chunk in content:
        content = content.replace(old_chunk, new_chunk)
        updated = True

    if old_chunk_axis in content:
        content = content.replace(old_chunk_axis, new_chunk_axis)
        updated = True

    if updated:
        with open(path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated {file_name}")
    else:
        print(f"No match in {file_name}")
