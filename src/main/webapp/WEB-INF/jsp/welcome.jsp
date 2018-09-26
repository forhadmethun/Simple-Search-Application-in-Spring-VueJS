<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->


<head>
    <meta charset="utf-8"/>
    <title>Simple Search Application</title>
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <link rel="stylesheet" href="https://unpkg.com/vue-multiselect@2.1.0/dist/vue-multiselect.min.css">


</head>
<body>
<div id="app" style="visibility: hidden">
    <v-app id="inspire">
        <v-navigation-drawer
                fixed
                v-model="drawer"
                app
        >
            <v-list dense>
                <v-list-tile @click="">
                    <v-list-tile-action>
                        <v-icon>home</v-icon>
                    </v-list-tile-action>
                    <v-list-tile-content>
                        <v-list-tile-title>Home</v-list-tile-title>
                    </v-list-tile-content>
                </v-list-tile>
            </v-list>
        </v-navigation-drawer>
        <v-toolbar color="indigo" dark fixed app>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>Simple Search Application</v-toolbar-title>
        </v-toolbar>
        <v-content>
            <v-app id="inspire">
                <v-toolbar
                        dark
                        color="teal"
                >
                    <v-autocomplete
                            :loading="eloading"
                            :items="emailitems"
                            :search-input.sync="searchEmail"
                            v-model="selectEmail"
                            cache-items
                            class="mx-3"
                            flat
                            hide-no-data
                            hide-details
                            label="Enter Email Address"
                            solo-inverted
                            @click="updateSeek($event)"
                            clearable

                    ></v-autocomplete>
                    <v-btn icon>
                        <v-icon>more_vert</v-icon>
                    </v-btn>
                </v-toolbar>
                <v-toolbar
                        dark
                        color="teal"
                >
                    <v-autocomplete
                            :loading="plloading"
                            :items="plitems"
                            :search-input.sync="searchProgrammingLanguage"
                            v-model="selectProgrammingLanguage"
                            cache-items
                            class="mx-3"
                            flat
                            hide-no-data
                            hide-details
                            label="Enter Programming Language(Ex: C, JAVA, PHP, ruby etc.)"
                            solo-inverted
                    ></v-autocomplete>
                    <v-btn icon>
                        <v-icon>more_vert</v-icon>
                    </v-btn>
                </v-toolbar>
                <v-toolbar
                        dark
                        color="teal"
                >
                    <v-autocomplete
                            :loading="lloading"
                            :items="litems"
                            :search-input.sync="searchLanguage"
                            v-model="selectLanguage"
                            cache-items
                            class="mx-3"
                            flat
                            hide-no-data
                            hide-details
                            label="Enter Language(Ex: jp, en, bd etc.)"
                            solo-inverted
                    ></v-autocomplete>
                    <v-btn icon>
                        <v-icon>more_vert</v-icon>
                    </v-btn>

                </v-toolbar>
                <div class="v-toolbar__content" style="height: 64px;">
                    <div class="v-toolbar__title"></div>
                    <hr class="mx-2 v-divider v-divider--inset v-divider--vertical theme--light">
                    <div class="spacer"></div>
                    <div class="v-dialog__container" style="display: inline-block;">
                        <div class="v-dialog__activator">
                            <button type="button" class="mb-2 v-btn theme--dark primary" style="position: relative;">
                                <div @click="getAllpna" class="v-btn__content">All Programming Language Not used</div>
                                <%--getAllProgrammingLanguageDataNotEnrolled--%>
                            </button>
                            <button type="button" class="mb-2 v-btn theme--dark primary" style="position: relative;">
                                <div @click="getAllData" class="v-btn__content">All Item</div>
                            </button>
                        </div>
                    </div>
                </div>
                <v-card>
                </v-card>


                <v-card>
                    <v-card-title>
                    </v-card-title>
                    <v-data-table
                            :headers="headers"
                            :items="tableItems"
                            :search="search"
                    >
                        <template slot="items" slot-scope="props">
                            <td>{{ props.item.email }}</td>
                            <td>{{ props.item.programmingLanguage
                                }}
                            </td>
                            <td>{{ props.item.language
                                }}
                            </td>
                        </template>

                        <v-alert slot="no-results" :value="true" color="error" icon="warning">
                            Your search for "{{ search }}" found no results.
                        </v-alert>
                    </v-data-table>
                </v-card>
                <%--start crud--%>
                <div>
                    <v-toolbar flat color="white">
                        <v-toolbar-title>Admin Panel(Interview)</v-toolbar-title>
                        <v-divider
                                class="mx-2"
                                inset
                                vertical
                        ></v-divider>
                        <v-spacer></v-spacer>
                        <v-dialog v-model="dialog" max-width="500px">
                            <v-btn slot="activator" color="primary" dark class="mb-2">New Item</v-btn>
                            <v-card>
                                <v-card-title>
                                    <span class="headline">{{ formTitle }}</span>
                                </v-card-title>

                                <v-card-text>
                                    <v-container grid-list-md>
                                        <v-layout wrap>
                                            <v-flex xs12 sm6 md4>
                                                <v-text-field v-model="editedItem.name"
                                                              label="Interview name"></v-text-field>
                                            </v-flex>
                                        </v-layout>
                                    </v-container>
                                </v-card-text>

                                <v-card-actions>
                                    <v-spacer></v-spacer>
                                    <v-btn color="blue darken-1" flat @click.native="close">Cancel</v-btn>
                                    <v-btn color="blue darken-1" flat @click.native="save">Save</v-btn>
                                </v-card-actions>
                            </v-card>
                        </v-dialog>
                    </v-toolbar>
                    <v-data-table
                            :headers="cheaders"
                            :items="desserts"
                            hide-actions
                            class="elevation-1"
                    >
                        <template slot="items" slot-scope="props">
                            <td>{{ props.item.name }}</td>
                            <td class="justify-center layout px-0">
                                <v-icon
                                        small
                                        class="mr-2"
                                        @click="editItem(props.item)"
                                >
                                    edit
                                </v-icon>
                                <v-icon
                                        small
                                        @click="deleteItem(props.item)"
                                >
                                    delete
                                </v-icon>
                            </td>
                        </template>
                        <template slot="no-data">
                            <v-btn color="primary" @click="initialize">Reset</v-btn>
                        </template>
                    </v-data-table>
                </div>


                <div>
                        <h2 style="margin-left: 2%;"><b>API</b></h2>

                        <p style="margin-left: 60px;background: #6ad06a;" >1. Search developer by developer id(<i>&lt;base url&gt;/getdeveloperbyid/{id}</i>), GET Request</p>
                        <br/><p style="margin-left: 60px;">
                        <br/>Request - <br/>
                        &nbsp;&nbsp;&nbsp;&nbsp; /getdeveloperbyid/1
                    <br/>
                    Response -
                    </p><br/>
                        <code>
                            {
                                id: 1,
                                email: "poohpool@signet.com",
                                languageEntities: [ ],
                                programmingLanguageEntities: [
                                {
                                    id: 18,
                                    name: "Obliq"
                                }
                                ]
                            }
                        </code>

                        <br/>
                        <br/>
                        <p style="margin-left: 60px;background: #6ad06a;" >2. Search developer by developer email(<i>&lt;base url&gt;/getdeveloperbyemail/{email}</i>), GET Request </p>
                        <br/><p style="margin-left: 60px;"> <br/>Request - <br/>
                        &nbsp;&nbsp;&nbsp;&nbsp; /getdeveloperbyemail/issabelle_gal@hotmail.com <br/>
                        Response -
                    </p><br/>
                        <code>
                            {
                                id: 1,
                                email: "poohpool@signet.com",
                                languageEntities: [ ],
                                programmingLanguageEntities: [
                                {
                                    id: 18,
                                    name: "Obliq"
                                }
                                ]
                            }
                        </code>

                        <br/>
                        <br/>
                        <p style="margin-left: 60px;background: #6ad06a;" >3. Create developer(<i>&lt;base url&gt;/getdeveloperbyemail/{email}</i>), POST Request</p>
                        <br/><p style="margin-left: 60px;"><br/>Request - <br/>
                        &nbsp;&nbsp;&nbsp;&nbsp; /createdeveloper </p><br/>
                        <code>
                            {

                                 "email": "hello_mail@signet.com",

                            }
                        </code>
                        <p style="margin-left: 60px;">Response -<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp; The details of the created developer.
                        </p>
                        <br/>
                        <br/>
                        <p style="margin-left: 60px;background: #6ad06a;" >4. Update developer(<i>&lt;base url&gt;/updatedeveloper</i>), PUT Request</p>
                        <br/><p style="margin-left: 60px;"><br/>Request - <br/>
                        &nbsp;&nbsp;&nbsp;&nbsp; /updatedeveloper </p><br/>
                        <code>
                            {
                              "id": 3,
                              "email": "hello_mail@signet.com",

                            }
                        </code>
                        <p style="margin-left: 60px;">Response -<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp; The details of the updated developer.
                        </p>

                        <br/>
                        <br/>
                        <p style="margin-left: 60px;background: #6ad06a;" >6. Delete a developer(<i>&lt;base url&gt;/deletedeveloper/{id}</i>), GET Request</p>
                        <br/><p style="margin-left: 60px;"><br/>Request - <br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  /deletedeveloper/1 </p><br/>
                        <p style="margin-left:60px">Response - </p>
                        <code>
                            return all developers list after deleting the developer with id 1
                        </code>


                        <p style="margin-left: 60px;background: #6ad06a;" >7. Get all developer (<i>&lt;base url&gt;/getalldeveloper</i>) </p>
                        <br/><p style="margin-left: 60px;"><br/>Request - <br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;  /getalldeveloper </p><br/>
                        <p style="margin-left:60px">Response - </p>
                        <div style="overflow-y: scroll; height:400px;margin-left:12%">
                            <code id="json"></code>
                        </div>


                        <br/><br/>

                    <%--</v-card>--%>
                </div>

                <%--<v-card-text style="height: 100px;margin-top:60px; position: relative">--%>
                <%--<v-fab-transition>--%>
                <%--<v-btn--%>
                <%--v-show="!hidden"--%>
                <%--color="pink"--%>
                <%--dark--%>
                <%--absolute--%>
                <%--top--%>
                <%--right--%>
                <%--fab--%>
                <%-->--%>
                <%--<v-icon>add</v-icon>--%>
                <%--</v-btn>--%>
                <%--</v-fab-transition>--%>
                <%--</v-card-text>--%>
            </v-app>

        </v-content>

        <v-footer color="indigo" app inset>
            <span class="white--text">&copy; Developed By, <a style="color:#c7f972;"
                                                              href="https://www.linkedin.com/in/forhadmethun/">Forhad Hossain Methun</a> </span>
        </v-footer>
    </v-app>
</div>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue-multiselect@2.1.0"></script>

<script>
    new Vue({
        el: '#app',
        components: {
            Multiselect: window.VueMultiselect.default
        },
        data: {
            drawer: null,
            search: '',
            headers: [
                {text: 'email', value: 'calories'},
                {text: 'programming_languages', value: 'fat'},
                {text: 'languages', value: 'carbs'},
            ],
            desserts: [
                {
                    value: false,
                    name: 'Frozen Yogurt',
                    calories: 159,
                    fat: 6.0,
                    carbs: 24,
                    protein: 4.0,
                    iron: '1%'
                },
                {
                    value: false,
                    name: 'Ice cream sandwich',
                    calories: 237,
                    fat: 9.0,
                    carbs: 37,
                    protein: 4.3,
                    iron: '1%'
                },
                {
                    value: false,
                    name: 'Eclair',
                    calories: 262,
                    fat: 16.0,
                    carbs: 23,
                    protein: 6.0,
                    iron: '7%'
                },
                {
                    value: false,
                    name: 'Cupcake',
                    calories: 305,
                    fat: 3.7,
                    carbs: 67,
                    protein: 4.3,
                    iron: '8%'
                },
                {
                    value: false,
                    name: 'Gingerbread',
                    calories: 356,
                    fat: 16.0,
                    carbs: 49,
                    protein: 3.9,
                    iron: '16%'
                },
                {
                    value: false,
                    name: 'Jelly bean',
                    calories: 375,
                    fat: 0.0,
                    carbs: 94,
                    protein: 0.0,
                    iron: '0%'
                },
                {
                    value: false,
                    name: 'Lollipop',
                    calories: 392,
                    fat: 0.2,
                    carbs: 98,
                    protein: 0,
                    iron: '2%'
                },
                {
                    value: false,
                    name: 'Honeycomb',
                    calories: 408,
                    fat: 3.2,
                    carbs: 87,
                    protein: 6.5,
                    iron: '45%'
                },
                {
                    value: false,
                    name: 'Donut',
                    calories: 452,
                    fat: 25.0,
                    carbs: 51,
                    protein: 4.9,
                    iron: '22%'
                },
                {
                    value: false,
                    name: 'KitKat',
                    calories: 518,
                    fat: 26.0,
                    carbs: 65,
                    protein: 7,
                    iron: '6%'
                }
            ],
            loading: false,
            eloading: false,
            lloading: false,
            plloading: false,
            items: [],
            emailitems: [],
            plitems: [],
            litems: [],
            searchEmail: null,
            searchProgrammingLanguage: null,
            searchLanguage: null,
            select: null,
            selectEmail: null,
            selectProgrammingLanguage: null,
            selectLanguage: null,
            states: [
                'Alabama',
                'Alaska',
                'American Samoa',
                'Arizona',
                'Arkansas',
                'California',
                'Colorado',
                'Connecticut',
                'Delaware',
                'District of Columbia',
                'Federated States of Micronesia',
                'Florida',
                'Georgia',
                'Guam',
                'Hawaii',
                'Idaho',
                'Illinois',
                'Indiana',
                'Iowa',
                'Kansas',
                'Kentucky',
                'Louisiana',
                'Maine',
                'Marshall Islands',
                'Maryland',
                'Massachusetts',
                'Michigan',
                'Minnesota',
                'Mississippi',
                'Missouri',
                'Montana',
                'Nebraska',
                'Nevada',
                'New Hampshire',
                'New Jersey',
                'New Mexico',
                'New York',
                'North Carolina',
                'North Dakota',
                'Northern Mariana Islands',
                'Ohio',
                'Oklahoma',
                'Oregon',
                'Palau',
                'Pennsylvania',
                'Puerto Rico',
                'Rhode Island',
                'South Carolina',
                'South Dakota',
                'Tennessee',
                'Texas',
                'Utah',
                'Vermont',
                'Virgin Island',
                'Virginia',
                'Washington',
                'West Virginia',
                'Wisconsin',
                'Wyoming'
            ],
            emails: [],
            programmingLanguages: [],
            languages: [],
            tableItems: [],


            value: [],
            options: [
                {name: 'Vue.js', language: 'JavaScript'},
                {name: 'Adonis', language: 'JavaScript'},
                {name: 'Rails', language: 'Ruby'},
                {name: 'Sinatra', language: 'Ruby'},
                {name: 'Laravel', language: 'PHP'},
                {name: 'Phoenix', language: 'Elixir'}
            ],


            //    added for crud operation
            dialog: false,
            cheaders: [
                {
                    text: 'Interview Name',
                    align: 'left',
                    sortable: true,
                    value: 'name'
                },
                // { text: 'Calories', value: 'calories' },
                // { text: 'Fat (g)', value: 'fat' },
                // { text: 'Carbs (g)', value: 'carbs' },
                // { text: 'Protein (g)', value: 'protein' },
                // { text: 'Actions', value: 'name', sortable: false }
            ],
            desserts: [],
            editedIndex: -1,
            editedItem: {
                name: '',
                calories: 0,
                fat: 0,
                carbs: 0,
                protein: 0
            },
            defaultItem: {
                name: '',
                calories: 0,
                fat: 0,
                carbs: 0,
                protein: 0
            },


        },
        watch: {
            searchEmail(val) {

                val && val !== this.select && this.querySelectionsSearchEmail(val.split('@', 1)[0]);
                if (!val) {
                    this.selectEmail = null;
                    this.searchAll();
                }
            },
            searchProgrammingLanguage(val) {
                val && val !== this.select && this.querySelectionsSearchProgrammingLanguage(val);
                if (!val) {
                    this.selectProgrammingLanguage = null;
                    this.searchAll();
                }

            },
            searchLanguage(val) {
                val && val !== this.select && this.querySelectionsSearchLanguage(val);
                if (!val) {
                    this.selectLanguage = null;
                    this.searchAll();
                }
            },
            dialog(val) {
                val || this.close()
            },

        },
        methods: {
            querySelections(v) {
                this.loading = true;
                // Simulated ajax query
                alert('val:' + v);
                setTimeout(() => {
                    this.items = this.states.filter(e => {
                        return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
                    });
                    this.loading = false
                }, 500)
            },
            querySelectionsSearchProgrammingLanguage(v) {
                this.plloading = true;
                // Simulated ajax query
                // alert('val:'+v);
                // alert('serch prog');


                axios.get('<%=request.getContextPath()%>/getprogramminglanguagelist/' + v)
                    .then((response) => {
                        this.programmingLanguages = response.data;
                        this.searchAll();


                    })
                    .catch(function (error) {
                        // handle error
                        console.log(error);
                    })
                    .then(function () {
                        // always executed

                        // alert('come');

                    });


                setTimeout(() => {
                    this.plitems = this.programmingLanguages.filter(e => {
                        return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
                    });
                    this.plloading = false
                }, 500);

            },
            querySelectionsSearchLanguage(v) {
                this.lloading = true;

                axios.get('<%=request.getContextPath()%>/getlanguagelist/' + v)
                    .then((response) => {
                        this.languages = response.data;
                        this.searchAll();
                    })
                    .catch(function (error) {
                        // handle error
                        console.log(error);
                    })
                    .then(function () {
                        // always executed
                    });


                setTimeout(() => {
                    this.litems = this.languages.filter(e => {
                        return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
                    });
                    this.lloading = false
                }, 500)
            },
            querySelectionsSearchEmail(v) {
                this.eloading = true;
                // console.log('--: ' + v);
                axios.get('<%=request.getContextPath()%>/getemaillist/' + v)
                    .then((response) => {
                        this.emails = response.data;
                        this.searchAll();
                    })
                    .catch(function (error) {
                        // handle error
                        // this.searchAll();
                        console.log(error);
                    })
                    .then(function () {
                        // this.searchAll();
                        // always executed
                    });


                setTimeout(() => {
                    this.emailitems = this.emails.filter(e => {
                        return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
                    });
                    this.eloading = false
                }, 500)
            },
            updateSeek(event) {
            },
            nameWithLang({name, language}) {
                return `${name} — [${language}]`
            },
            searchAll() {
                var data = {
                    "email": this.selectEmail,
                    "code": this.selectLanguage,
                    "name": this.selectProgrammingLanguage
                };
                axios.post('<%=request.getContextPath()%>/searchalldata', {data})
                    .then(result => {
                        this.tableItems = result.data;
                    })
                    .catch(function (error) {
                    });
            },
            getAllDeveloper() {
                axios.get('<%=request.getContextPath()%>/getalldeveloper')
                    .then(result => {
                        document.getElementById("json").innerHTML = JSON.stringify(result.data, undefined, 2);



                    })
                    .catch(function (error) {
                    });
            },


            //    for crud -
            initialize() {
                this.desserts = [
                    {
                        name: 'Frozen Yogurt',
                        calories: 159,
                        fat: 6.0,
                        carbs: 24,
                        protein: 4.0
                    },
                    {
                        name: 'Ice cream sandwich',
                        calories: 237,
                        fat: 9.0,
                        carbs: 37,
                        protein: 4.3
                    },
                    {
                        name: 'Eclair',
                        calories: 262,
                        fat: 16.0,
                        carbs: 23,
                        protein: 6.0
                    },
                    {
                        name: 'Cupcake',
                        calories: 305,
                        fat: 3.7,
                        carbs: 67,
                        protein: 4.3
                    },
                    {
                        name: 'Gingerbread',
                        calories: 356,
                        fat: 16.0,
                        carbs: 49,
                        protein: 3.9
                    },
                    {
                        name: 'Jelly bean',
                        calories: 375,
                        fat: 0.0,
                        carbs: 94,
                        protein: 0.0
                    },
                    {
                        name: 'Lollipop',
                        calories: 392,
                        fat: 0.2,
                        carbs: 98,
                        protein: 0
                    },
                    {
                        name: 'Honeycomb',
                        calories: 408,
                        fat: 3.2,
                        carbs: 87,
                        protein: 6.5
                    },
                    {
                        name: 'Donut',
                        calories: 452,
                        fat: 25.0,
                        carbs: 51,
                        protein: 4.9
                    },
                    {
                        name: 'KitKat',
                        calories: 518,
                        fat: 26.0,
                        carbs: 65,
                        protein: 7
                    }
                ];

                axios.get('<%=request.getContextPath()%>/getinterview')
                    .then((response) => {
                        this.desserts = response.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    })
                    .then(function () {

                    });

            },

            editItem(item) {
                this.editedIndex = this.desserts.indexOf(item);
                this.editedItem = Object.assign({}, item);
                this.dialog = true
            },

            deleteItem(item) {

                const index = this.desserts.indexOf(item);
                if (confirm('Are you sure you want to delete this item?')) {
                    // this.desserts.splice(index, 1);

                    axios.get('<%=request.getContextPath()%>/deleteinterview/' + item.id)
                        .then((response) => {
                            this.initialize();
                            // this.searchAll();
                        })
                        .catch(function (error) {
                            // handle error
                            console.log(error);
                        })
                        .then(function () {
                            // always executed
                        });


                }
            },

            close() {
                this.dialog = false;
                setTimeout(() => {
                    this.editedItem = Object.assign({}, this.defaultItem)
                    this.editedIndex = -1
                }, 300)
            },

            save() {
                if (this.editedIndex > -1) {
                    axios.post('<%=request.getContextPath()%>/updateinterview', {
                        "id": this.editedItem.id,
                        "name": this.editedItem.name,
                    })
                        .then(result => {
                            this.initialize();

                        })
                        .catch(function (error) {
                        });


                } else {
                    console.log('!! inter view add called!!');
                    var data = {
                        "name": this.editedItem,
                    };
                    console.log(JSON.stringify(data));

                    axios.post('<%=request.getContextPath()%>/createinterview', {"name": this.editedItem.name})
                        .then(result => {
                            this.initialize();

                        })
                        .catch(function (error) {
                        });
                    this.desserts.push(this.editedItem)
                }
                this.close()
            },

            getAllData() {
                axios.get('<%=request.getContextPath()%>/searchall')
                    .then((response) => {
                        this.tableItems = response.data;
                        document.getElementById('app').style.visibility = 'visible';
                    })
                    .catch(function (error) {

                        console.log(error);
                    })
                    .then(function () {
                    });
            },
            getAllpna() {
                axios.get('<%=request.getContextPath()%>/allpna')
                    .then((response) => {
                        this.tableItems = response.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    })
                    .then(function () {
                    });
            },

        },
        updated: function () {
            this.$nextTick(function () {
            })
        },
        computed: {
            formTitle() {
                return this.editedIndex === -1 ? 'New Item' : 'Edit Item'
            }
        },
        created() {
            this.initialize()
        },


        mounted: function () {
            axios.get('<%=request.getContextPath()%>/searchall')
                .then((response) => {
                    console.log(response);
                    this.tableItems = response.data;
                    document.getElementById('app').style.visibility = 'visible';

                    this.getAllDeveloper();
                })
                .catch(function (error) {

                    console.log(error);
                })
                .then(function () {
                });


        }
    })
</script>


</body>

</html>
