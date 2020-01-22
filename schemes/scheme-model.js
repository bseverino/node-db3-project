const db = require('../data/db-config.js')

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes')
        .where('id', id)
        .first()
}

function findSteps(id) {
    return db('steps as st')
        .where('st.scheme_id', id)
        .join('schemes as sc', 'st.scheme_id', 'sc.id')
        .select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
        .orderBy('st.step_number')
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
        .then(ids => {
            return findById(ids[0])
        })
}

function update(changes, id) {
    return db('schemes')
        .where('id', id)
        .update(changes)
        .then(() => {
            return findById(id)
        })
}

function remove(id) {
    return db('schemes')
        .where('id', id)
        .del()
}