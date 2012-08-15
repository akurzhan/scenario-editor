window.sirius.Signal::defaults =
  phase: []

window.sirius.Signal::resolve_references =
  window.sirius.ReferenceHelper.resolver('node_id', 'node', 'node', 'signal', 'Signal', true)

window.sirius.Signal::encode_references = ->
  @set 'node_id', @get('node').id

window.sirius.Signal::phase_with_nema = (nema) ->
  _.find(@get('phase'), (phase) -> phase.get('nema') == nema)

window.sirius.Signal::calc_phase_row_col = ->
  _.each(@get('phase'),
    (ph) ->
      nema = ph.get('nema')
      if nema <= 4
        ph.row = 0
      else
        ph.row = 1
      ph.set('column', (nema-1) % 4)
  )

  _.each(@get('phase'),
    (ph) ->
      if(ph.has('lag'))
        if(nema % 2 == 1)
          alt_ph = @phase_with_nema(nema + 1)
          ph.set('column', 1 + ph.get('column'))
          alt_ph.set('column', alt_ph.get('column') - 1)
        else
          trace("phase cannot have lag=true and nema=#{nema}")
  )